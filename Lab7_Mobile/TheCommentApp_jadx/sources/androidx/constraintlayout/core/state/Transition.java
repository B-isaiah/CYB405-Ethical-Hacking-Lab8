package androidx.constraintlayout.core.state;

import androidx.constraintlayout.core.motion.Motion;
import androidx.constraintlayout.core.motion.MotionWidget;
import androidx.constraintlayout.core.motion.key.MotionKeyAttributes;
import androidx.constraintlayout.core.motion.key.MotionKeyCycle;
import androidx.constraintlayout.core.motion.key.MotionKeyPosition;
import androidx.constraintlayout.core.motion.utils.KeyCache;
import androidx.constraintlayout.core.motion.utils.TypedBundle;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.constraintlayout.core.widgets.ConstraintWidget;
import androidx.constraintlayout.core.widgets.ConstraintWidgetContainer;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class Transition {
    public static final int END = 1;
    public static final int INTERPOLATED = 2;
    public static final int START = 0;
    HashMap<String, WidgetState> state = new HashMap<>();
    HashMap<Integer, HashMap<String, KeyPosition>> keyPositions = new HashMap<>();
    private int pathMotionArc = -1;

    public KeyPosition findPreviousPosition(String target, int frameNumber) {
        KeyPosition keyPosition;
        while (frameNumber >= 0) {
            HashMap<String, KeyPosition> map = this.keyPositions.get(Integer.valueOf(frameNumber));
            if (map != null && (keyPosition = map.get(target)) != null) {
                return keyPosition;
            }
            frameNumber--;
        }
        return null;
    }

    public KeyPosition findNextPosition(String target, int frameNumber) {
        KeyPosition keyPosition;
        while (frameNumber <= 100) {
            HashMap<String, KeyPosition> map = this.keyPositions.get(Integer.valueOf(frameNumber));
            if (map != null && (keyPosition = map.get(target)) != null) {
                return keyPosition;
            }
            frameNumber++;
        }
        return null;
    }

    public int getNumberKeyPositions(WidgetFrame frame) {
        int numKeyPositions = 0;
        for (int frameNumber = 0; frameNumber <= 100; frameNumber++) {
            HashMap<String, KeyPosition> map = this.keyPositions.get(Integer.valueOf(frameNumber));
            if (map != null) {
                KeyPosition keyPosition = map.get(frame.widget.stringId);
                if (keyPosition != null) {
                    numKeyPositions++;
                }
            }
        }
        return numKeyPositions;
    }

    public Motion getMotion(String id) {
        return getWidgetState(id, null, 0).motionControl;
    }

    public void fillKeyPositions(WidgetFrame frame, float[] x, float[] y, float[] pos) {
        KeyPosition keyPosition;
        int numKeyPositions = 0;
        for (int frameNumber = 0; frameNumber <= 100; frameNumber++) {
            HashMap<String, KeyPosition> map = this.keyPositions.get(Integer.valueOf(frameNumber));
            if (map != null && (keyPosition = map.get(frame.widget.stringId)) != null) {
                x[numKeyPositions] = keyPosition.x;
                y[numKeyPositions] = keyPosition.y;
                pos[numKeyPositions] = keyPosition.frame;
                numKeyPositions++;
            }
        }
    }

    public boolean hasPositionKeyframes() {
        return this.keyPositions.size() > 0;
    }

    public void setTransitionProperties(TypedBundle bundle) {
        this.pathMotionArc = bundle.getInteger(TypedValues.Position.TYPE_PATH_MOTION_ARC);
    }

    static class WidgetState {
        Motion motionControl;
        KeyCache myKeyCache = new KeyCache();
        int myParentHeight = -1;
        int myParentWidth = -1;
        WidgetFrame start = new WidgetFrame();
        WidgetFrame end = new WidgetFrame();
        WidgetFrame interpolated = new WidgetFrame();
        MotionWidget motionWidgetStart = new MotionWidget(this.start);
        MotionWidget motionWidgetEnd = new MotionWidget(this.end);
        MotionWidget motionWidgetInterpolated = new MotionWidget(this.interpolated);

        public WidgetState() {
            Motion motion = new Motion(this.motionWidgetStart);
            this.motionControl = motion;
            motion.setStart(this.motionWidgetStart);
            this.motionControl.setEnd(this.motionWidgetEnd);
        }

        public void setKeyPosition(TypedBundle prop) {
            MotionKeyPosition keyPosition = new MotionKeyPosition();
            prop.applyDelta(keyPosition);
            this.motionControl.addKey(keyPosition);
        }

        public void setKeyAttribute(TypedBundle prop) {
            MotionKeyAttributes keyAttributes = new MotionKeyAttributes();
            prop.applyDelta(keyAttributes);
            this.motionControl.addKey(keyAttributes);
        }

        public void setKeyCycle(TypedBundle prop) {
            MotionKeyCycle keyAttributes = new MotionKeyCycle();
            prop.applyDelta(keyAttributes);
            this.motionControl.addKey(keyAttributes);
        }

        public void update(ConstraintWidget child, int state) {
            if (state == 0) {
                this.start.update(child);
                this.motionControl.setStart(this.motionWidgetStart);
            } else if (state == 1) {
                this.end.update(child);
                this.motionControl.setEnd(this.motionWidgetEnd);
            }
            this.myParentWidth = -1;
        }

        public WidgetFrame getFrame(int type) {
            if (type == 0) {
                return this.start;
            }
            if (type == 1) {
                return this.end;
            }
            return this.interpolated;
        }

        public void interpolate(int parentWidth, int parentHeight, float progress, Transition transition) {
            this.myParentHeight = parentHeight;
            this.myParentWidth = parentWidth;
            this.motionControl.setup(parentWidth, parentHeight, 1.0f, System.nanoTime());
            WidgetFrame.interpolate(parentWidth, parentHeight, this.interpolated, this.start, this.end, transition, progress);
            this.interpolated.interpolatedPos = progress;
            this.motionControl.interpolate(this.motionWidgetInterpolated, progress, System.nanoTime(), this.myKeyCache);
        }
    }

    static class KeyPosition {
        int frame;
        String target;
        int type;
        float x;
        float y;

        public KeyPosition(String target, int frame, int type, float x, float y) {
            this.target = target;
            this.frame = frame;
            this.type = type;
            this.x = x;
            this.y = y;
        }
    }

    public boolean isEmpty() {
        return this.state.isEmpty();
    }

    public void clear() {
        this.state.clear();
    }

    public boolean contains(String key) {
        return this.state.containsKey(key);
    }

    public void addKeyPosition(String target, TypedBundle bundle) {
        getWidgetState(target, null, 0).setKeyPosition(bundle);
    }

    public void addKeyAttribute(String target, TypedBundle bundle) {
        getWidgetState(target, null, 0).setKeyAttribute(bundle);
    }

    public void addKeyCycle(String target, TypedBundle bundle) {
        getWidgetState(target, null, 0).setKeyCycle(bundle);
    }

    public void addKeyPosition(String target, int frame, int type, float x, float y) {
        TypedBundle bundle = new TypedBundle();
        bundle.add(TypedValues.Position.TYPE_POSITION_TYPE, 2);
        bundle.add(100, frame);
        bundle.add(TypedValues.Position.TYPE_PERCENT_X, x);
        bundle.add(TypedValues.Position.TYPE_PERCENT_Y, y);
        getWidgetState(target, null, 0).setKeyPosition(bundle);
        KeyPosition keyPosition = new KeyPosition(target, frame, type, x, y);
        HashMap<String, KeyPosition> map = this.keyPositions.get(Integer.valueOf(frame));
        if (map == null) {
            map = new HashMap<>();
            this.keyPositions.put(Integer.valueOf(frame), map);
        }
        map.put(target, keyPosition);
    }

    public void addCustomFloat(int state, String widgetId, String property, float value) {
        WidgetState widgetState = getWidgetState(widgetId, null, state);
        WidgetFrame frame = widgetState.getFrame(state);
        frame.addCustomFloat(property, value);
    }

    public void addCustomColor(int state, String widgetId, String property, int color) {
        WidgetState widgetState = getWidgetState(widgetId, null, state);
        WidgetFrame frame = widgetState.getFrame(state);
        frame.addCustomColor(property, color);
    }

    public void updateFrom(ConstraintWidgetContainer container, int state) {
        ArrayList<ConstraintWidget> children = container.getChildren();
        int count = children.size();
        for (int i = 0; i < count; i++) {
            ConstraintWidget child = children.get(i);
            WidgetState widgetState = getWidgetState(child.stringId, null, state);
            widgetState.update(child, state);
        }
    }

    public void interpolate(int parentWidth, int parentHeight, float progress) {
        for (String key : this.state.keySet()) {
            WidgetState widget = this.state.get(key);
            widget.interpolate(parentWidth, parentHeight, progress, this);
        }
    }

    public WidgetFrame getStart(String id) {
        WidgetState widgetState = this.state.get(id);
        if (widgetState == null) {
            return null;
        }
        return widgetState.start;
    }

    public WidgetFrame getEnd(String id) {
        WidgetState widgetState = this.state.get(id);
        if (widgetState == null) {
            return null;
        }
        return widgetState.end;
    }

    public WidgetFrame getInterpolated(String id) {
        WidgetState widgetState = this.state.get(id);
        if (widgetState == null) {
            return null;
        }
        return widgetState.interpolated;
    }

    public float[] getPath(String id) {
        WidgetState widgetState = this.state.get(id);
        int frames = 1000 / 16;
        float[] mPoints = new float[frames * 2];
        widgetState.motionControl.buildPath(mPoints, frames);
        return mPoints;
    }

    public int getKeyFrames(String id, float[] rectangles, int[] pathMode, int[] position) {
        WidgetState widgetState = this.state.get(id);
        return widgetState.motionControl.buildKeyFrames(rectangles, pathMode, position);
    }

    private WidgetState getWidgetState(String widgetId, ConstraintWidget child, int transitionState) {
        WidgetState widgetState = this.state.get(widgetId);
        if (widgetState == null) {
            widgetState = new WidgetState();
            if (this.pathMotionArc != -1) {
                widgetState.motionControl.setPathMotionArc(this.pathMotionArc);
            }
            this.state.put(widgetId, widgetState);
            if (child != null) {
                widgetState.update(child, transitionState);
            }
        }
        return widgetState;
    }

    public WidgetFrame getStart(ConstraintWidget child) {
        return getWidgetState(child.stringId, null, 0).start;
    }

    public WidgetFrame getEnd(ConstraintWidget child) {
        return getWidgetState(child.stringId, null, 1).end;
    }

    public WidgetFrame getInterpolated(ConstraintWidget child) {
        return getWidgetState(child.stringId, null, 2).interpolated;
    }
}
