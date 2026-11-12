package androidx.constraintlayout.core.widgets.analyzer;

import androidx.constraintlayout.core.LinearSystem;
import androidx.constraintlayout.core.Metrics;
import androidx.constraintlayout.core.widgets.Barrier;
import androidx.constraintlayout.core.widgets.ConstraintAnchor;
import androidx.constraintlayout.core.widgets.ConstraintWidget;
import androidx.constraintlayout.core.widgets.ConstraintWidgetContainer;
import androidx.constraintlayout.core.widgets.Guideline;
import androidx.constraintlayout.core.widgets.Helper;
import androidx.constraintlayout.core.widgets.Optimizer;
import androidx.constraintlayout.core.widgets.VirtualLayout;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class BasicMeasure {
    public static final int AT_MOST = Integer.MIN_VALUE;
    private static final boolean DEBUG = false;
    public static final int EXACTLY = 1073741824;
    public static final int FIXED = -3;
    public static final int MATCH_PARENT = -1;
    private static final int MODE_SHIFT = 30;
    public static final int UNSPECIFIED = 0;
    public static final int WRAP_CONTENT = -2;
    private ConstraintWidgetContainer constraintWidgetContainer;
    private final ArrayList<ConstraintWidget> mVariableDimensionsWidgets = new ArrayList<>();
    private Measure mMeasure = new Measure();

    public static class Measure {
        public static int SELF_DIMENSIONS = 0;
        public static int TRY_GIVEN_DIMENSIONS = 1;
        public static int USE_GIVEN_DIMENSIONS = 2;
        public ConstraintWidget.DimensionBehaviour horizontalBehavior;
        public int horizontalDimension;
        public int measureStrategy;
        public int measuredBaseline;
        public boolean measuredHasBaseline;
        public int measuredHeight;
        public boolean measuredNeedsSolverPass;
        public int measuredWidth;
        public ConstraintWidget.DimensionBehaviour verticalBehavior;
        public int verticalDimension;
    }

    public interface Measurer {
        void didMeasures();

        void measure(ConstraintWidget constraintWidget, Measure measure);
    }

    public void updateHierarchy(ConstraintWidgetContainer layout) {
        this.mVariableDimensionsWidgets.clear();
        int childCount = layout.mChildren.size();
        for (int i = 0; i < childCount; i++) {
            ConstraintWidget widget = layout.mChildren.get(i);
            if (widget.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || widget.getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                this.mVariableDimensionsWidgets.add(widget);
            }
        }
        layout.invalidateGraph();
    }

    public BasicMeasure(ConstraintWidgetContainer constraintWidgetContainer) {
        this.constraintWidgetContainer = constraintWidgetContainer;
    }

    private void measureChildren(ConstraintWidgetContainer layout) {
        int childCount = layout.mChildren.size();
        boolean optimize = layout.optimizeFor(64);
        Measurer measurer = layout.getMeasurer();
        for (int i = 0; i < childCount; i++) {
            ConstraintWidget child = layout.mChildren.get(i);
            if (!(child instanceof Guideline) && !(child instanceof Barrier) && !child.isInVirtualLayout() && (!optimize || child.horizontalRun == null || child.verticalRun == null || !child.horizontalRun.dimension.resolved || !child.verticalRun.dimension.resolved)) {
                boolean skip = false;
                ConstraintWidget.DimensionBehaviour widthBehavior = child.getDimensionBehaviour(0);
                ConstraintWidget.DimensionBehaviour heightBehavior = child.getDimensionBehaviour(1);
                if (widthBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultWidth != 1 && heightBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultHeight != 1) {
                    skip = true;
                }
                if (!skip && layout.optimizeFor(1) && !(child instanceof VirtualLayout)) {
                    if (widthBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultWidth == 0 && heightBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && !child.isInHorizontalChain()) {
                        skip = true;
                    }
                    if (heightBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultHeight == 0 && widthBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && !child.isInHorizontalChain()) {
                        skip = true;
                    }
                    if ((widthBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || heightBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) && child.mDimensionRatio > 0.0f) {
                        skip = true;
                    }
                }
                if (!skip) {
                    measure(measurer, child, Measure.SELF_DIMENSIONS);
                    if (layout.mMetrics != null) {
                        layout.mMetrics.measuredWidgets++;
                    }
                }
            }
        }
        measurer.didMeasures();
    }

    private void solveLinearSystem(ConstraintWidgetContainer layout, String reason, int pass, int w, int h) {
        int minWidth = layout.getMinWidth();
        int minHeight = layout.getMinHeight();
        layout.setMinWidth(0);
        layout.setMinHeight(0);
        layout.setWidth(w);
        layout.setHeight(h);
        layout.setMinWidth(minWidth);
        layout.setMinHeight(minHeight);
        this.constraintWidgetContainer.setPass(pass);
        this.constraintWidgetContainer.layout();
    }

    /* JADX WARN: Code duplicated, block: B:102:0x0179  */
    /* JADX WARN: Code duplicated, block: B:103:0x0197  */
    /* JADX WARN: Code duplicated, block: B:106:0x01a6  */
    /* JADX WARN: Code duplicated, block: B:108:0x01af  */
    /* JADX WARN: Code duplicated, block: B:109:0x01b2  */
    /* JADX WARN: Code duplicated, block: B:112:0x01be  */
    /* JADX WARN: Code duplicated, block: B:113:0x01c1  */
    /* JADX WARN: Code duplicated, block: B:116:0x01e4  */
    /* JADX WARN: Code duplicated, block: B:118:0x01f0  */
    /* JADX WARN: Code duplicated, block: B:119:0x01f6  */
    /* JADX WARN: Code duplicated, block: B:121:0x020b  */
    /* JADX WARN: Code duplicated, block: B:122:0x0216  */
    /* JADX WARN: Code duplicated, block: B:125:0x0222  */
    /* JADX WARN: Code duplicated, block: B:130:0x0244  */
    /* JADX WARN: Code duplicated, block: B:132:0x0248  */
    /* JADX WARN: Code duplicated, block: B:134:0x024c  */
    /* JADX WARN: Code duplicated, block: B:139:0x026e  */
    /* JADX WARN: Code duplicated, block: B:141:0x0272  */
    /* JADX WARN: Code duplicated, block: B:146:0x0292  */
    /* JADX WARN: Code duplicated, block: B:148:0x0298  */
    /* JADX WARN: Code duplicated, block: B:169:0x02e8  */
    /* JADX WARN: Code duplicated, block: B:170:0x02ed  */
    /* JADX WARN: Code duplicated, block: B:173:0x02fb  */
    /* JADX WARN: Code duplicated, block: B:174:0x0308  */
    /* JADX WARN: Code duplicated, block: B:177:0x0316  */
    /* JADX WARN: Code duplicated, block: B:179:0x031b  */
    /* JADX WARN: Code duplicated, block: B:182:0x0337  */
    /* JADX WARN: Code duplicated, block: B:184:0x033b  */
    /* JADX WARN: Code duplicated, block: B:186:0x0341  */
    /* JADX WARN: Code duplicated, block: B:188:0x0346  */
    /* JADX WARN: Code duplicated, block: B:191:0x0363  */
    /* JADX WARN: Code duplicated, block: B:193:0x0367  */
    /* JADX WARN: Code duplicated, block: B:196:0x036f  */
    /* JADX WARN: Code duplicated, block: B:202:0x0385 A[LOOP:2: B:145:0x0290->B:202:0x0385, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:205:0x03a6  */
    /* JADX WARN: Code duplicated, block: B:218:0x039f A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:222:0x0377 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:60:0x00c6  */
    /* JADX WARN: Code duplicated, block: B:74:0x010a  */
    /* JADX WARN: Code duplicated, block: B:76:0x0112  */
    /* JADX WARN: Code duplicated, block: B:77:0x011e  */
    /* JADX WARN: Code duplicated, block: B:79:0x0123  */
    /* JADX WARN: Code duplicated, block: B:80:0x012d  */
    /* JADX WARN: Code duplicated, block: B:82:0x0130  */
    /* JADX WARN: Code duplicated, block: B:85:0x0135  */
    /* JADX WARN: Code duplicated, block: B:87:0x0138  */
    /* JADX WARN: Code duplicated, block: B:88:0x013a  */
    /* JADX WARN: Code duplicated, block: B:91:0x0147  */
    /* JADX WARN: Code duplicated, block: B:99:0x016b  */
    public long solverMeasure(ConstraintWidgetContainer layout, int optimizationLevel, int paddingX, int paddingY, int widthMode, int widthSize, int heightMode, int heightSize, int lastMeasureWidth, int lastMeasureHeight) {
        boolean optimize;
        boolean matchHeight;
        boolean optimize2;
        int computations;
        boolean z;
        boolean allSolved;
        int computations2;
        boolean z2;
        int sizeDependentWidgetsCount;
        long layoutTime;
        boolean needSolverPass;
        boolean z3;
        boolean containerWrapWidth;
        boolean z4;
        boolean containerWrapHeight;
        int minWidth;
        int minHeight;
        int i;
        int j;
        int i2;
        boolean needSolverPass2;
        int minWidth2;
        int minHeight2;
        int sizeDependentWidgetsCount2;
        Measurer measurer;
        ConstraintWidget widget;
        int preWidth;
        int preHeight;
        int measureStrategy;
        int sizeDependentWidgetsCount3;
        int sizeDependentWidgetsCount4;
        int measureStrategy2;
        boolean needSolverPass3;
        int measuredWidth;
        int measuredHeight;
        ConstraintWidget widget2;
        int preWidth2;
        int preHeight2;
        boolean needSolverPass4;
        int measuredWidth2;
        int measuredHeight2;
        int widthSize2;
        int heightSize2;
        boolean allSolved2;
        boolean z5;
        boolean z6;
        Measurer measurer2 = layout.getMeasurer();
        long layoutTime2 = 0;
        int childCount = layout.mChildren.size();
        int startingWidth = layout.getWidth();
        int startingHeight = layout.getHeight();
        boolean optimizeWrap = Optimizer.enabled(optimizationLevel, 128);
        boolean optimize3 = optimizeWrap || Optimizer.enabled(optimizationLevel, 64);
        if (!optimize3) {
            optimize = optimize3;
        } else {
            int i3 = 0;
            while (true) {
                if (i3 >= childCount) {
                    optimize = optimize3;
                } else {
                    ConstraintWidget child = layout.mChildren.get(i3);
                    boolean matchWidth = child.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
                    boolean optimize4 = optimize3;
                    boolean matchHeight2 = child.getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
                    boolean ratio = matchWidth && matchHeight2 && child.getDimensionRatio() > 0.0f;
                    if (child.isInHorizontalChain() && ratio) {
                        matchHeight = false;
                        break;
                    }
                    if (child.isInVerticalChain() && ratio) {
                        matchHeight = false;
                        break;
                    }
                    boolean matchHeight3 = child instanceof VirtualLayout;
                    if (matchHeight3) {
                        matchHeight = false;
                        break;
                    }
                    if (!child.isInHorizontalChain() && !child.isInVerticalChain()) {
                        i3++;
                        optimize3 = optimize4;
                    } else {
                        matchHeight = false;
                        break;
                    }
                }
            }
            if (matchHeight && LinearSystem.sMetrics != null) {
                LinearSystem.sMetrics.measures++;
            }
            optimize2 = matchHeight & ((widthMode != 1073741824 && heightMode == 1073741824) || optimizeWrap);
            computations = 0;
            if (optimize2) {
                z = true;
                allSolved = false;
                computations2 = 0;
            } else {
                widthSize2 = Math.min(layout.getMaxWidth(), widthSize);
                heightSize2 = Math.min(layout.getMaxHeight(), heightSize);
                if (widthMode == 1073741824 && layout.getWidth() != widthSize2) {
                    layout.setWidth(widthSize2);
                    layout.invalidateGraph();
                }
                if (heightMode == 1073741824 && layout.getHeight() != heightSize2) {
                    layout.setHeight(heightSize2);
                    layout.invalidateGraph();
                }
                if (widthMode != 1073741824 && heightMode == 1073741824) {
                    allSolved2 = layout.directMeasure(optimizeWrap);
                    computations = 2;
                    widthSize2 = widthSize2;
                    z5 = true;
                } else {
                    allSolved2 = layout.directMeasureSetup(optimizeWrap);
                    if (widthMode == 1073741824) {
                        allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 0);
                        computations = 0 + 1;
                    }
                    if (heightMode != 1073741824) {
                        z5 = true;
                    } else {
                        z5 = true;
                        allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 1);
                        computations++;
                    }
                }
                if (allSolved2) {
                    if (widthMode != 1073741824) {
                        z5 = false;
                    }
                    if (heightMode == 1073741824) {
                        z6 = true;
                    } else {
                        z6 = false;
                    }
                    layout.updateFromRuns(z5, z6);
                }
                computations2 = computations;
                allSolved = allSolved2;
                z = true;
            }
            if (!allSolved && computations2 == 2) {
                return 0L;
            }
            int optimizationLevel2 = layout.getOptimizationLevel();
            if (childCount > 0) {
                measureChildren(layout);
            }
            updateHierarchy(layout);
            int sizeDependentWidgetsCount5 = this.mVariableDimensionsWidgets.size();
            if (childCount > 0) {
                z2 = false;
                solveLinearSystem(layout, "First pass", 0, startingWidth, startingHeight);
            } else {
                z2 = false;
            }
            sizeDependentWidgetsCount = sizeDependentWidgetsCount5;
            if (sizeDependentWidgetsCount > 0) {
                layoutTime = 0;
            } else {
                needSolverPass = false;
                if (layout.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    z3 = z;
                } else {
                    z3 = z2;
                }
                containerWrapWidth = z3;
                if (layout.getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    z4 = z;
                } else {
                    z4 = z2;
                }
                containerWrapHeight = z4;
                minWidth = Math.max(layout.getWidth(), this.constraintWidgetContainer.getMinWidth());
                minHeight = Math.max(layout.getHeight(), this.constraintWidgetContainer.getMinHeight());
                i = 0;
                while (i < sizeDependentWidgetsCount) {
                    widget2 = this.mVariableDimensionsWidgets.get(i);
                    if (!(widget2 instanceof VirtualLayout)) {
                        layoutTime2 = layoutTime2;
                    } else {
                        preWidth2 = widget2.getWidth();
                        preHeight2 = widget2.getHeight();
                        needSolverPass4 = needSolverPass | measure(measurer2, widget2, Measure.TRY_GIVEN_DIMENSIONS);
                        if (layout.mMetrics != null) {
                            Metrics metrics = layout.mMetrics;
                            long layoutTime3 = metrics.measuredMatchWidgets;
                            metrics.measuredMatchWidgets = layoutTime3 + 1;
                        }
                        measuredWidth2 = widget2.getWidth();
                        measuredHeight2 = widget2.getHeight();
                        if (measuredWidth2 != preWidth2) {
                            widget2.setWidth(measuredWidth2);
                            if (!containerWrapWidth && widget2.getRight() > minWidth) {
                                int w = widget2.getRight() + widget2.getAnchor(ConstraintAnchor.Type.RIGHT).getMargin();
                                minWidth = Math.max(minWidth, w);
                            }
                            needSolverPass4 = true;
                        }
                        if (measuredHeight2 != preHeight2) {
                            widget2.setHeight(measuredHeight2);
                            if (!containerWrapHeight && widget2.getBottom() > minHeight) {
                                int h = widget2.getBottom() + widget2.getAnchor(ConstraintAnchor.Type.BOTTOM).getMargin();
                                minHeight = Math.max(minHeight, h);
                            }
                            needSolverPass4 = true;
                        }
                        VirtualLayout virtualLayout = (VirtualLayout) widget2;
                        needSolverPass = needSolverPass4 | virtualLayout.needSolverPass();
                    }
                    i++;
                    childCount = childCount;
                    layoutTime2 = layoutTime2;
                }
                layoutTime = layoutTime2;
                j = 0;
                while (j < 2) {
                    i2 = 0;
                    needSolverPass2 = needSolverPass;
                    minWidth2 = minWidth;
                    minHeight2 = minHeight;
                    while (i2 < sizeDependentWidgetsCount) {
                        widget = this.mVariableDimensionsWidgets.get(i2);
                        if ((!(widget instanceof Helper) && !(widget instanceof VirtualLayout)) || (widget instanceof Guideline) || widget.getVisibility() == 8 || ((optimize2 && widget.horizontalRun.dimension.resolved && widget.verticalRun.dimension.resolved) || (widget instanceof VirtualLayout))) {
                            sizeDependentWidgetsCount3 = sizeDependentWidgetsCount;
                            measurer2 = measurer2;
                        } else {
                            preWidth = widget.getWidth();
                            preHeight = widget.getHeight();
                            int preBaselineDistance = widget.getBaselineDistance();
                            measureStrategy = Measure.TRY_GIVEN_DIMENSIONS;
                            sizeDependentWidgetsCount3 = sizeDependentWidgetsCount;
                            sizeDependentWidgetsCount4 = 2 - 1;
                            if (j != sizeDependentWidgetsCount4) {
                                measureStrategy2 = measureStrategy;
                            } else {
                                int measureStrategy3 = Measure.USE_GIVEN_DIMENSIONS;
                                measureStrategy2 = measureStrategy3;
                            }
                            boolean hasMeasure = measure(measurer2, widget, measureStrategy2);
                            needSolverPass3 = needSolverPass2 | hasMeasure;
                            if (layout.mMetrics != null) {
                                layout.mMetrics.measuredMatchWidgets++;
                            }
                            measuredWidth = widget.getWidth();
                            measuredHeight = widget.getHeight();
                            if (measuredWidth != preWidth) {
                                widget.setWidth(measuredWidth);
                                if (!containerWrapWidth && widget.getRight() > minWidth2) {
                                    int w2 = widget.getRight() + widget.getAnchor(ConstraintAnchor.Type.RIGHT).getMargin();
                                    minWidth2 = Math.max(minWidth2, w2);
                                }
                                needSolverPass2 = true;
                            }
                            if (measuredHeight != preHeight) {
                                needSolverPass2 = needSolverPass3;
                                widget.setHeight(measuredHeight);
                                if (!containerWrapHeight && widget.getBottom() > minHeight2) {
                                    int h2 = widget.getBottom() + widget.getAnchor(ConstraintAnchor.Type.BOTTOM).getMargin();
                                    minHeight2 = Math.max(minHeight2, h2);
                                }
                                needSolverPass2 = true;
                            } else {
                                needSolverPass2 = needSolverPass3;
                            }
                            if (!widget.hasBaseline() && preBaselineDistance != widget.getBaselineDistance()) {
                                needSolverPass2 = true;
                            }
                        }
                        i2++;
                        sizeDependentWidgetsCount = sizeDependentWidgetsCount3;
                        measurer2 = measurer2;
                    }
                    sizeDependentWidgetsCount2 = sizeDependentWidgetsCount;
                    measurer = measurer2;
                    if (needSolverPass2) {
                        break;
                    }
                    solveLinearSystem(layout, "intermediate pass", j + 1, startingWidth, startingHeight);
                    needSolverPass = false;
                    j++;
                    sizeDependentWidgetsCount = sizeDependentWidgetsCount2;
                    minWidth = minWidth2;
                    minHeight = minHeight2;
                    measurer2 = measurer;
                }
            }
            layout.setOptimizationLevel(optimizationLevel2);
            return layoutTime;
        }
        matchHeight = optimize;
        if (matchHeight) {
            LinearSystem.sMetrics.measures++;
        }
        optimize2 = matchHeight & ((widthMode != 1073741824 && heightMode == 1073741824) || optimizeWrap);
        computations = 0;
        if (optimize2) {
            z = true;
            allSolved = false;
            computations2 = 0;
        } else {
            widthSize2 = Math.min(layout.getMaxWidth(), widthSize);
            heightSize2 = Math.min(layout.getMaxHeight(), heightSize);
            if (widthMode == 1073741824) {
                layout.setWidth(widthSize2);
                layout.invalidateGraph();
            }
            if (heightMode == 1073741824) {
                layout.setHeight(heightSize2);
                layout.invalidateGraph();
            }
            if (widthMode != 1073741824) {
                allSolved2 = layout.directMeasureSetup(optimizeWrap);
                if (widthMode == 1073741824) {
                    allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 0);
                    computations = 0 + 1;
                }
                if (heightMode != 1073741824) {
                    z5 = true;
                } else {
                    z5 = true;
                    allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 1);
                    computations++;
                }
            } else {
                allSolved2 = layout.directMeasureSetup(optimizeWrap);
                if (widthMode == 1073741824) {
                    allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 0);
                    computations = 0 + 1;
                }
                if (heightMode != 1073741824) {
                    z5 = true;
                } else {
                    z5 = true;
                    allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 1);
                    computations++;
                }
            }
            if (allSolved2) {
                if (widthMode != 1073741824) {
                    z5 = false;
                }
                if (heightMode == 1073741824) {
                    z6 = true;
                } else {
                    z6 = false;
                }
                layout.updateFromRuns(z5, z6);
            }
            computations2 = computations;
            allSolved = allSolved2;
            z = true;
        }
        if (!allSolved) {
        }
        int optimizationLevel3 = layout.getOptimizationLevel();
        if (childCount > 0) {
            measureChildren(layout);
        }
        updateHierarchy(layout);
        int sizeDependentWidgetsCount6 = this.mVariableDimensionsWidgets.size();
        if (childCount > 0) {
            z2 = false;
            solveLinearSystem(layout, "First pass", 0, startingWidth, startingHeight);
        } else {
            z2 = false;
        }
        sizeDependentWidgetsCount = sizeDependentWidgetsCount6;
        if (sizeDependentWidgetsCount > 0) {
            layoutTime = 0;
        } else {
            needSolverPass = false;
            if (layout.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                z3 = z;
            } else {
                z3 = z2;
            }
            containerWrapWidth = z3;
            if (layout.getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                z4 = z;
            } else {
                z4 = z2;
            }
            containerWrapHeight = z4;
            minWidth = Math.max(layout.getWidth(), this.constraintWidgetContainer.getMinWidth());
            minHeight = Math.max(layout.getHeight(), this.constraintWidgetContainer.getMinHeight());
            i = 0;
            while (i < sizeDependentWidgetsCount) {
                widget2 = this.mVariableDimensionsWidgets.get(i);
                if (!(widget2 instanceof VirtualLayout)) {
                    layoutTime2 = layoutTime2;
                } else {
                    preWidth2 = widget2.getWidth();
                    preHeight2 = widget2.getHeight();
                    needSolverPass4 = needSolverPass | measure(measurer2, widget2, Measure.TRY_GIVEN_DIMENSIONS);
                    if (layout.mMetrics != null) {
                        Metrics metrics2 = layout.mMetrics;
                        long layoutTime4 = metrics2.measuredMatchWidgets;
                        metrics2.measuredMatchWidgets = layoutTime4 + 1;
                    }
                    measuredWidth2 = widget2.getWidth();
                    measuredHeight2 = widget2.getHeight();
                    if (measuredWidth2 != preWidth2) {
                        widget2.setWidth(measuredWidth2);
                        if (!containerWrapWidth) {
                        }
                        needSolverPass4 = true;
                    }
                    if (measuredHeight2 != preHeight2) {
                        widget2.setHeight(measuredHeight2);
                        if (!containerWrapHeight) {
                        }
                        needSolverPass4 = true;
                    }
                    VirtualLayout virtualLayout2 = (VirtualLayout) widget2;
                    needSolverPass = needSolverPass4 | virtualLayout2.needSolverPass();
                }
                i++;
                childCount = childCount;
                layoutTime2 = layoutTime2;
            }
            layoutTime = layoutTime2;
            j = 0;
            while (j < 2) {
                i2 = 0;
                needSolverPass2 = needSolverPass;
                minWidth2 = minWidth;
                minHeight2 = minHeight;
                while (i2 < sizeDependentWidgetsCount) {
                    widget = this.mVariableDimensionsWidgets.get(i2);
                    if (!(widget instanceof Helper)) {
                        preWidth = widget.getWidth();
                        preHeight = widget.getHeight();
                        int preBaselineDistance2 = widget.getBaselineDistance();
                        measureStrategy = Measure.TRY_GIVEN_DIMENSIONS;
                        sizeDependentWidgetsCount3 = sizeDependentWidgetsCount;
                        sizeDependentWidgetsCount4 = 2 - 1;
                        if (j != sizeDependentWidgetsCount4) {
                            measureStrategy2 = measureStrategy;
                        } else {
                            int measureStrategy4 = Measure.USE_GIVEN_DIMENSIONS;
                            measureStrategy2 = measureStrategy4;
                        }
                        boolean hasMeasure2 = measure(measurer2, widget, measureStrategy2);
                        needSolverPass3 = needSolverPass2 | hasMeasure2;
                        if (layout.mMetrics != null) {
                            layout.mMetrics.measuredMatchWidgets++;
                        }
                        measuredWidth = widget.getWidth();
                        measuredHeight = widget.getHeight();
                        if (measuredWidth != preWidth) {
                            widget.setWidth(measuredWidth);
                            if (!containerWrapWidth) {
                            }
                            needSolverPass2 = true;
                        }
                        if (measuredHeight != preHeight) {
                            needSolverPass2 = needSolverPass3;
                            widget.setHeight(measuredHeight);
                            if (!containerWrapHeight) {
                            }
                            needSolverPass2 = true;
                        } else {
                            needSolverPass2 = needSolverPass3;
                        }
                        if (!widget.hasBaseline()) {
                        }
                    } else {
                        preWidth = widget.getWidth();
                        preHeight = widget.getHeight();
                        int preBaselineDistance3 = widget.getBaselineDistance();
                        measureStrategy = Measure.TRY_GIVEN_DIMENSIONS;
                        sizeDependentWidgetsCount3 = sizeDependentWidgetsCount;
                        sizeDependentWidgetsCount4 = 2 - 1;
                        if (j != sizeDependentWidgetsCount4) {
                            measureStrategy2 = measureStrategy;
                        } else {
                            int measureStrategy5 = Measure.USE_GIVEN_DIMENSIONS;
                            measureStrategy2 = measureStrategy5;
                        }
                        boolean hasMeasure3 = measure(measurer2, widget, measureStrategy2);
                        needSolverPass3 = needSolverPass2 | hasMeasure3;
                        if (layout.mMetrics != null) {
                            layout.mMetrics.measuredMatchWidgets++;
                        }
                        measuredWidth = widget.getWidth();
                        measuredHeight = widget.getHeight();
                        if (measuredWidth != preWidth) {
                            widget.setWidth(measuredWidth);
                            if (!containerWrapWidth) {
                            }
                            needSolverPass2 = true;
                        }
                        if (measuredHeight != preHeight) {
                            needSolverPass2 = needSolverPass3;
                            widget.setHeight(measuredHeight);
                            if (!containerWrapHeight) {
                            }
                            needSolverPass2 = true;
                        } else {
                            needSolverPass2 = needSolverPass3;
                        }
                        if (!widget.hasBaseline()) {
                        }
                    }
                    i2++;
                    sizeDependentWidgetsCount = sizeDependentWidgetsCount3;
                    measurer2 = measurer2;
                }
                sizeDependentWidgetsCount2 = sizeDependentWidgetsCount;
                measurer = measurer2;
                if (needSolverPass2) {
                    break;
                    break;
                }
                solveLinearSystem(layout, "intermediate pass", j + 1, startingWidth, startingHeight);
                needSolverPass = false;
                j++;
                sizeDependentWidgetsCount = sizeDependentWidgetsCount2;
                minWidth = minWidth2;
                minHeight = minHeight2;
                measurer2 = measurer;
            }
        }
        layout.setOptimizationLevel(optimizationLevel3);
        return layoutTime;
    }

    private boolean measure(Measurer measurer, ConstraintWidget widget, int measureStrategy) {
        this.mMeasure.horizontalBehavior = widget.getHorizontalDimensionBehaviour();
        this.mMeasure.verticalBehavior = widget.getVerticalDimensionBehaviour();
        this.mMeasure.horizontalDimension = widget.getWidth();
        this.mMeasure.verticalDimension = widget.getHeight();
        this.mMeasure.measuredNeedsSolverPass = false;
        this.mMeasure.measureStrategy = measureStrategy;
        boolean horizontalMatchConstraints = this.mMeasure.horizontalBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        boolean verticalMatchConstraints = this.mMeasure.verticalBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        boolean horizontalUseRatio = horizontalMatchConstraints && widget.mDimensionRatio > 0.0f;
        boolean verticalUseRatio = verticalMatchConstraints && widget.mDimensionRatio > 0.0f;
        if (horizontalUseRatio && widget.mResolvedMatchConstraintDefault[0] == 4) {
            this.mMeasure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
        }
        if (verticalUseRatio && widget.mResolvedMatchConstraintDefault[1] == 4) {
            this.mMeasure.verticalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
        }
        measurer.measure(widget, this.mMeasure);
        widget.setWidth(this.mMeasure.measuredWidth);
        widget.setHeight(this.mMeasure.measuredHeight);
        widget.setHasBaseline(this.mMeasure.measuredHasBaseline);
        widget.setBaselineDistance(this.mMeasure.measuredBaseline);
        this.mMeasure.measureStrategy = Measure.SELF_DIMENSIONS;
        return this.mMeasure.measuredNeedsSolverPass;
    }
}
