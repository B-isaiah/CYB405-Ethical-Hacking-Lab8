package androidx.constraintlayout.core.state;

import androidx.constraintlayout.core.motion.CustomVariable;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.constraintlayout.core.parser.CLElement;
import androidx.constraintlayout.core.parser.CLKey;
import androidx.constraintlayout.core.parser.CLNumber;
import androidx.constraintlayout.core.parser.CLObject;
import androidx.constraintlayout.core.parser.CLParsingException;
import androidx.constraintlayout.core.widgets.ConstraintWidget;
import java.util.HashMap;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class WidgetFrame {
    private static final boolean OLD_SYSTEM = true;
    public static float phone_orientation = Float.NaN;
    public float alpha;
    public int bottom;
    public float interpolatedPos;
    public int left;
    public final HashMap<String, CustomVariable> mCustom;
    public String name;
    public float pivotX;
    public float pivotY;
    public int right;
    public float rotationX;
    public float rotationY;
    public float rotationZ;
    public float scaleX;
    public float scaleY;
    public int top;
    public float translationX;
    public float translationY;
    public float translationZ;
    public int visibility;
    public ConstraintWidget widget;

    public int width() {
        return Math.max(0, this.right - this.left);
    }

    public int height() {
        return Math.max(0, this.bottom - this.top);
    }

    public WidgetFrame() {
        this.widget = null;
        this.left = 0;
        this.top = 0;
        this.right = 0;
        this.bottom = 0;
        this.pivotX = Float.NaN;
        this.pivotY = Float.NaN;
        this.rotationX = Float.NaN;
        this.rotationY = Float.NaN;
        this.rotationZ = Float.NaN;
        this.translationX = Float.NaN;
        this.translationY = Float.NaN;
        this.translationZ = Float.NaN;
        this.scaleX = Float.NaN;
        this.scaleY = Float.NaN;
        this.alpha = Float.NaN;
        this.interpolatedPos = Float.NaN;
        this.visibility = 0;
        this.mCustom = new HashMap<>();
        this.name = null;
    }

    public WidgetFrame(ConstraintWidget widget) {
        this.widget = null;
        this.left = 0;
        this.top = 0;
        this.right = 0;
        this.bottom = 0;
        this.pivotX = Float.NaN;
        this.pivotY = Float.NaN;
        this.rotationX = Float.NaN;
        this.rotationY = Float.NaN;
        this.rotationZ = Float.NaN;
        this.translationX = Float.NaN;
        this.translationY = Float.NaN;
        this.translationZ = Float.NaN;
        this.scaleX = Float.NaN;
        this.scaleY = Float.NaN;
        this.alpha = Float.NaN;
        this.interpolatedPos = Float.NaN;
        this.visibility = 0;
        this.mCustom = new HashMap<>();
        this.name = null;
        this.widget = widget;
    }

    public WidgetFrame(WidgetFrame frame) {
        this.widget = null;
        this.left = 0;
        this.top = 0;
        this.right = 0;
        this.bottom = 0;
        this.pivotX = Float.NaN;
        this.pivotY = Float.NaN;
        this.rotationX = Float.NaN;
        this.rotationY = Float.NaN;
        this.rotationZ = Float.NaN;
        this.translationX = Float.NaN;
        this.translationY = Float.NaN;
        this.translationZ = Float.NaN;
        this.scaleX = Float.NaN;
        this.scaleY = Float.NaN;
        this.alpha = Float.NaN;
        this.interpolatedPos = Float.NaN;
        this.visibility = 0;
        this.mCustom = new HashMap<>();
        this.name = null;
        this.widget = frame.widget;
        this.left = frame.left;
        this.top = frame.top;
        this.right = frame.right;
        this.bottom = frame.bottom;
        updateAttributes(frame);
    }

    public void updateAttributes(WidgetFrame frame) {
        this.pivotX = frame.pivotX;
        this.pivotY = frame.pivotY;
        this.rotationX = frame.rotationX;
        this.rotationY = frame.rotationY;
        this.rotationZ = frame.rotationZ;
        this.translationX = frame.translationX;
        this.translationY = frame.translationY;
        this.translationZ = frame.translationZ;
        this.scaleX = frame.scaleX;
        this.scaleY = frame.scaleY;
        this.alpha = frame.alpha;
        this.visibility = frame.visibility;
        this.mCustom.clear();
        if (frame != null) {
            for (CustomVariable c : frame.mCustom.values()) {
                this.mCustom.put(c.getName(), c.copy());
            }
        }
    }

    public boolean isDefaultTransform() {
        if (Float.isNaN(this.rotationX) && Float.isNaN(this.rotationY) && Float.isNaN(this.rotationZ) && Float.isNaN(this.translationX) && Float.isNaN(this.translationY) && Float.isNaN(this.translationZ) && Float.isNaN(this.scaleX) && Float.isNaN(this.scaleY) && Float.isNaN(this.alpha)) {
            return OLD_SYSTEM;
        }
        return false;
    }

    public static void interpolate(int parentWidth, int parentHeight, WidgetFrame frame, WidgetFrame start, WidgetFrame end, Transition transition, float progress) {
        float startAlpha;
        int startWidth;
        int startHeight;
        int endHeight;
        float f;
        int startY;
        float progressPosition;
        int startX;
        int interpolateStartFrame;
        int frameNumber = (int) (progress * 100.0f);
        int startX2 = start.left;
        int startY2 = start.top;
        int endX = end.left;
        int endY = end.top;
        int startWidth2 = start.right - start.left;
        int startHeight2 = start.bottom - start.top;
        int endWidth = end.right - end.left;
        int i = end.bottom;
        int startWidth3 = end.top;
        int endHeight2 = i - startWidth3;
        float progressPosition2 = start.alpha;
        float endAlpha = end.alpha;
        if (start.visibility != 8) {
            startAlpha = progressPosition2;
            startWidth = startWidth2;
            startHeight = startHeight2;
        } else {
            startX2 = (int) (startX2 - (endWidth / 2.0f));
            startY2 = (int) (startY2 - (endHeight2 / 2.0f));
            startHeight = endHeight2;
            if (Float.isNaN(progressPosition2)) {
                startWidth = endWidth;
                startAlpha = 0.0f;
            } else {
                startWidth = endWidth;
                startAlpha = progressPosition2;
            }
        }
        int startX3 = startX2;
        if (end.visibility != 8) {
            endHeight = endHeight2;
        } else {
            endX = (int) (endX - (startWidth / 2.0f));
            endY = (int) (endY - (startHeight / 2.0f));
            endWidth = startWidth;
            endHeight = startHeight;
            if (Float.isNaN(endAlpha)) {
                endAlpha = 0.0f;
            }
        }
        if (Float.isNaN(startAlpha) && !Float.isNaN(endAlpha)) {
            startAlpha = 1.0f;
        }
        if (!Float.isNaN(startAlpha) && Float.isNaN(endAlpha)) {
            endAlpha = 1.0f;
        }
        if (frame.widget == null || !transition.hasPositionKeyframes()) {
            f = progress;
            startY = startY2;
            progressPosition = progress;
            startX = startX3;
        } else {
            Transition.KeyPosition firstPosition = transition.findPreviousPosition(frame.widget.stringId, frameNumber);
            int startY3 = startY2;
            Transition.KeyPosition lastPosition = transition.findNextPosition(frame.widget.stringId, frameNumber);
            if (firstPosition == lastPosition) {
                lastPosition = null;
            }
            int interpolateEndFrame = 100;
            if (firstPosition != null) {
                startX3 = (int) (firstPosition.x * parentWidth);
                int startY4 = (int) (firstPosition.y * parentHeight);
                interpolateStartFrame = firstPosition.frame;
                startY3 = startY4;
            } else {
                interpolateStartFrame = 0;
            }
            if (lastPosition != null) {
                int endX2 = (int) (lastPosition.x * parentWidth);
                endY = (int) (lastPosition.y * parentHeight);
                interpolateEndFrame = lastPosition.frame;
                endX = endX2;
            }
            f = progress;
            progressPosition = ((100.0f * f) - interpolateStartFrame) / (interpolateEndFrame - interpolateStartFrame);
            startY = startY3;
            startX = startX3;
        }
        frame.widget = start.widget;
        float startAlpha2 = startAlpha;
        int i2 = (int) (startX + ((endX - startX) * progressPosition));
        frame.left = i2;
        int i3 = (int) (startY + ((endY - startY) * progressPosition));
        frame.top = i3;
        int width = (int) (((1.0f - f) * startWidth) + (endWidth * f));
        int height = (int) (((1.0f - f) * startHeight) + (endHeight * f));
        frame.right = i2 + width;
        frame.bottom = i3 + height;
        frame.pivotX = interpolate(start.pivotX, end.pivotX, 0.5f, f);
        frame.pivotY = interpolate(start.pivotY, end.pivotY, 0.5f, f);
        frame.rotationX = interpolate(start.rotationX, end.rotationX, 0.0f, f);
        frame.rotationY = interpolate(start.rotationY, end.rotationY, 0.0f, f);
        frame.rotationZ = interpolate(start.rotationZ, end.rotationZ, 0.0f, f);
        frame.scaleX = interpolate(start.scaleX, end.scaleX, 1.0f, f);
        frame.scaleY = interpolate(start.scaleY, end.scaleY, 1.0f, f);
        frame.translationX = interpolate(start.translationX, end.translationX, 0.0f, f);
        frame.translationY = interpolate(start.translationY, end.translationY, 0.0f, f);
        frame.translationZ = interpolate(start.translationZ, end.translationZ, 0.0f, f);
        frame.alpha = interpolate(startAlpha2, endAlpha, 1.0f, f);
    }

    private static float interpolate(float start, float end, float defaultValue, float progress) {
        boolean isStartUnset = Float.isNaN(start);
        boolean isEndUnset = Float.isNaN(end);
        if (isStartUnset && isEndUnset) {
            return Float.NaN;
        }
        if (isStartUnset) {
            start = defaultValue;
        }
        if (isEndUnset) {
            end = defaultValue;
        }
        return ((end - start) * progress) + start;
    }

    public float centerX() {
        int i = this.left;
        return i + ((this.right - i) / 2.0f);
    }

    public float centerY() {
        int i = this.top;
        return i + ((this.bottom - i) / 2.0f);
    }

    public WidgetFrame update() {
        ConstraintWidget constraintWidget = this.widget;
        if (constraintWidget != null) {
            this.left = constraintWidget.getLeft();
            this.top = this.widget.getTop();
            this.right = this.widget.getRight();
            this.bottom = this.widget.getBottom();
            WidgetFrame frame = this.widget.frame;
            updateAttributes(frame);
        }
        return this;
    }

    public WidgetFrame update(ConstraintWidget widget) {
        if (widget == null) {
            return this;
        }
        this.widget = widget;
        update();
        return this;
    }

    public void addCustomColor(String name, int color) {
        setCustomAttribute(name, TypedValues.Custom.TYPE_COLOR, color);
    }

    public int getCustomColor(String name) {
        if (this.mCustom.containsKey(name)) {
            int color = this.mCustom.get(name).getColorValue();
            return color;
        }
        return -21880;
    }

    public void addCustomFloat(String name, float value) {
        setCustomAttribute(name, TypedValues.Custom.TYPE_FLOAT, value);
    }

    public float getCustomFloat(String name) {
        if (this.mCustom.containsKey(name)) {
            return this.mCustom.get(name).getFloatValue();
        }
        return Float.NaN;
    }

    public void setCustomAttribute(String name, int type, float value) {
        if (this.mCustom.containsKey(name)) {
            this.mCustom.get(name).setFloatValue(value);
        } else {
            this.mCustom.put(name, new CustomVariable(name, type, value));
        }
    }

    public void setCustomAttribute(String name, int type, int value) {
        if (this.mCustom.containsKey(name)) {
            this.mCustom.get(name).setIntValue(value);
        } else {
            this.mCustom.put(name, new CustomVariable(name, type, value));
        }
    }

    public void setCustomAttribute(String name, int type, boolean value) {
        if (this.mCustom.containsKey(name)) {
            this.mCustom.get(name).setBooleanValue(value);
        } else {
            this.mCustom.put(name, new CustomVariable(name, type, value));
        }
    }

    public void setCustomAttribute(String name, int type, String value) {
        if (this.mCustom.containsKey(name)) {
            this.mCustom.get(name).setStringValue(value);
        } else {
            this.mCustom.put(name, new CustomVariable(name, type, value));
        }
    }

    public CustomVariable getCustomAttribute(String name) {
        return this.mCustom.get(name);
    }

    public Set<String> getCustomAttributeNames() {
        return this.mCustom.keySet();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:59:0x00d1  */
    public boolean setValue(String key, CLElement value) throws CLParsingException {
        switch (key) {
            case "pivotX":
                this.pivotX = value.getFloat();
                return OLD_SYSTEM;
            case "pivotY":
                this.pivotY = value.getFloat();
                return OLD_SYSTEM;
            case "rotationX":
                this.rotationX = value.getFloat();
                return OLD_SYSTEM;
            case "rotationY":
                this.rotationY = value.getFloat();
                return OLD_SYSTEM;
            case "rotationZ":
                this.rotationZ = value.getFloat();
                return OLD_SYSTEM;
            case "translationX":
                this.translationX = value.getFloat();
                return OLD_SYSTEM;
            case "translationY":
                this.translationY = value.getFloat();
                return OLD_SYSTEM;
            case "translationZ":
                this.translationZ = value.getFloat();
                return OLD_SYSTEM;
            case "scaleX":
                this.scaleX = value.getFloat();
                return OLD_SYSTEM;
            case "scaleY":
                this.scaleY = value.getFloat();
                return OLD_SYSTEM;
            case "alpha":
                this.alpha = value.getFloat();
                return OLD_SYSTEM;
            case "interpolatedPos":
                this.interpolatedPos = value.getFloat();
                return OLD_SYSTEM;
            case "phone_orientation":
                phone_orientation = value.getFloat();
                return OLD_SYSTEM;
            case "top":
                this.top = value.getInt();
                return OLD_SYSTEM;
            case "left":
                this.left = value.getInt();
                return OLD_SYSTEM;
            case "right":
                this.right = value.getInt();
                return OLD_SYSTEM;
            case "bottom":
                this.bottom = value.getInt();
                return OLD_SYSTEM;
            case "custom":
                parseCustom(value);
                return OLD_SYSTEM;
            default:
                return false;
        }
    }

    void parseCustom(CLElement custom) throws CLParsingException {
        CLObject obj = (CLObject) custom;
        int n = obj.size();
        for (int i = 0; i < n; i++) {
            CLElement tmp = obj.get(i);
            CLKey k = (CLKey) tmp;
            k.content();
            CLElement v = k.getValue();
            String vStr = v.content();
            if (vStr.matches("#[0-9a-fA-F]+")) {
                int color = Integer.parseInt(vStr.substring(1), 16);
                setCustomAttribute(k.content(), TypedValues.Custom.TYPE_COLOR, color);
            } else if (v instanceof CLNumber) {
                setCustomAttribute(k.content(), TypedValues.Custom.TYPE_FLOAT, v.getFloat());
            } else {
                setCustomAttribute(k.content(), TypedValues.Custom.TYPE_STRING, vStr);
            }
        }
    }

    public StringBuilder serialize(StringBuilder ret) {
        return serialize(ret, false);
    }

    public StringBuilder serialize(StringBuilder ret, boolean sendPhoneOrientation) {
        ret.append("{\n");
        add(ret, "left", this.left);
        add(ret, "top", this.top);
        add(ret, "right", this.right);
        add(ret, "bottom", this.bottom);
        add(ret, "pivotX", this.pivotX);
        add(ret, "pivotY", this.pivotY);
        add(ret, "rotationX", this.rotationX);
        add(ret, "rotationY", this.rotationY);
        add(ret, "rotationZ", this.rotationZ);
        add(ret, "translationX", this.translationX);
        add(ret, "translationY", this.translationY);
        add(ret, "translationZ", this.translationZ);
        add(ret, "scaleX", this.scaleX);
        add(ret, "scaleY", this.scaleY);
        add(ret, "alpha", this.alpha);
        add(ret, "visibility", this.left);
        add(ret, "interpolatedPos", this.interpolatedPos);
        if (sendPhoneOrientation) {
            add(ret, "phone_orientation", phone_orientation);
        }
        if (sendPhoneOrientation) {
            add(ret, "phone_orientation", phone_orientation);
        }
        if (this.mCustom.size() != 0) {
            ret.append("custom : {\n");
            for (String s : this.mCustom.keySet()) {
                CustomVariable value = this.mCustom.get(s);
                ret.append(s);
                ret.append(": ");
                switch (value.getType()) {
                    case TypedValues.Custom.TYPE_INT /* 900 */:
                        ret.append(value.getIntegerValue());
                        ret.append(",\n");
                        break;
                    case TypedValues.Custom.TYPE_FLOAT /* 901 */:
                    case TypedValues.Custom.TYPE_DIMENSION /* 905 */:
                        ret.append(value.getFloatValue());
                        ret.append(",\n");
                        break;
                    case TypedValues.Custom.TYPE_COLOR /* 902 */:
                        ret.append("'");
                        ret.append(CustomVariable.colorString(value.getIntegerValue()));
                        ret.append("',\n");
                        break;
                    case TypedValues.Custom.TYPE_STRING /* 903 */:
                        ret.append("'");
                        ret.append(value.getStringValue());
                        ret.append("',\n");
                        break;
                    case TypedValues.Custom.TYPE_BOOLEAN /* 904 */:
                        ret.append("'");
                        ret.append(value.getBooleanValue());
                        ret.append("',\n");
                        break;
                }
            }
            ret.append("}\n");
        }
        ret.append("}\n");
        return ret;
    }

    private static void add(StringBuilder s, String title, int value) {
        s.append(title);
        s.append(": ");
        s.append(value);
        s.append(",\n");
    }

    private static void add(StringBuilder s, String title, float value) {
        if (Float.isNaN(value)) {
            return;
        }
        s.append(title);
        s.append(": ");
        s.append(value);
        s.append(",\n");
    }

    void printCustomAttributes() {
        StackTraceElement s = new Throwable().getStackTrace()[1];
        String ss = (".(" + s.getFileName() + ":" + s.getLineNumber() + ") " + s.getMethodName()) + " " + (hashCode() % 1000);
        String ss2 = this.widget != null ? ss + "/" + (this.widget.hashCode() % 1000) + " " : ss + "/NULL ";
        HashMap<String, CustomVariable> map = this.mCustom;
        if (map != null) {
            for (String key : map.keySet()) {
                System.out.println(ss2 + this.mCustom.get(key).toString());
            }
        }
    }

    void logv(String str) {
        String ss;
        StackTraceElement s = new Throwable().getStackTrace()[1];
        String ss2 = (".(" + s.getFileName() + ":" + s.getLineNumber() + ") " + s.getMethodName()) + " " + (hashCode() % 1000);
        if (this.widget != null) {
            ss = ss2 + "/" + (this.widget.hashCode() % 1000);
        } else {
            ss = ss2 + "/NULL";
        }
        System.out.println(ss + " " + str);
    }
}
