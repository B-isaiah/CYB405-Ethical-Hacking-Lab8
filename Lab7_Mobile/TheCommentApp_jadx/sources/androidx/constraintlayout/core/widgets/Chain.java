package androidx.constraintlayout.core.widgets;

import androidx.constraintlayout.core.ArrayRow;
import androidx.constraintlayout.core.LinearSystem;
import androidx.constraintlayout.core.SolverVariable;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class Chain {
    private static final boolean DEBUG = false;
    public static final boolean USE_CHAIN_OPTIMIZATION = false;

    public static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem system, ArrayList<ConstraintWidget> widgets, int orientation) {
        int offset;
        int chainsSize;
        ChainHead[] chainsArray;
        if (orientation == 0) {
            offset = 0;
            chainsSize = constraintWidgetContainer.mHorizontalChainsSize;
            chainsArray = constraintWidgetContainer.mHorizontalChainsArray;
        } else {
            offset = 2;
            chainsSize = constraintWidgetContainer.mVerticalChainsSize;
            chainsArray = constraintWidgetContainer.mVerticalChainsArray;
        }
        for (int i = 0; i < chainsSize; i++) {
            ChainHead first = chainsArray[i];
            first.define();
            if (widgets == null || (widgets != null && widgets.contains(first.mFirst))) {
                applyChainConstraints(constraintWidgetContainer, system, orientation, offset, first);
            }
        }
    }

    static void applyChainConstraints(ConstraintWidgetContainer container, LinearSystem system, int orientation, int offset, ChainHead chainHead) {
        boolean isChainSpread;
        boolean isChainSpreadInside;
        boolean isChainPacked;
        ConstraintWidget widget;
        ArrayList<ConstraintWidget> listMatchConstraints;
        ConstraintWidget head;
        SolverVariable endTarget;
        ConstraintAnchor begin;
        ConstraintAnchor end;
        int endPointsStrength;
        int i;
        ConstraintWidget next;
        ConstraintWidget next2;
        ConstraintAnchor beginNextAnchor;
        SolverVariable beginNextTarget;
        SolverVariable beginNext;
        int nextMargin;
        int strength;
        SolverVariable beginTarget;
        ConstraintAnchor beginNextAnchor2;
        SolverVariable beginNext2;
        int nextMargin2;
        int margin1;
        int margin2;
        int strength2;
        ConstraintWidget previousVisibleWidget;
        ConstraintAnchor end2;
        ConstraintWidget head2;
        float bias;
        int count;
        float totalWeights;
        int margin;
        ConstraintWidget next3;
        int strength3;
        int i2 = orientation;
        ChainHead chainHead2 = chainHead;
        ConstraintWidget first = chainHead2.mFirst;
        ConstraintWidget last = chainHead2.mLast;
        ConstraintWidget firstVisibleWidget = chainHead2.mFirstVisibleWidget;
        ConstraintWidget lastVisibleWidget = chainHead2.mLastVisibleWidget;
        ConstraintWidget head3 = chainHead2.mHead;
        boolean done = false;
        float totalWeights2 = chainHead2.mTotalWeight;
        ConstraintWidget firstMatchConstraintsWidget = chainHead2.mFirstMatchConstraintWidget;
        ConstraintWidget previousMatchConstraintsWidget = chainHead2.mLastMatchConstraintWidget;
        ConstraintWidget widget2 = first;
        boolean isWrapContent = container.mListDimensionBehaviors[i2] == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
        if (i2 == 0) {
            boolean isChainSpread2 = head3.mHorizontalChainStyle == 0;
            isChainSpread = isChainSpread2;
            boolean isChainSpreadInside2 = head3.mHorizontalChainStyle == 1;
            isChainSpreadInside = isChainSpreadInside2;
            isChainPacked = head3.mHorizontalChainStyle == 2;
        } else {
            boolean isChainSpread3 = head3.mVerticalChainStyle == 0;
            isChainSpread = isChainSpread3;
            boolean isChainSpreadInside3 = head3.mVerticalChainStyle == 1;
            isChainSpreadInside = isChainSpreadInside3;
            isChainPacked = head3.mVerticalChainStyle == 2;
        }
        while (!done) {
            ConstraintAnchor begin2 = widget2.mListAnchors[offset];
            int strength4 = 4;
            if (isChainPacked) {
                strength4 = 1;
            }
            int margin3 = begin2.getMargin();
            boolean isSpreadOnly = widget2.mListDimensionBehaviors[i2] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget2.mResolvedMatchConstraintDefault[i2] == 0;
            if (begin2.mTarget != null && widget2 != first) {
                margin = margin3 + begin2.mTarget.getMargin();
            } else {
                margin = margin3;
            }
            if (isChainPacked && widget2 != first && widget2 != firstVisibleWidget) {
                strength4 = 8;
            }
            float totalWeights3 = totalWeights2;
            if (begin2.mTarget == null) {
                previousMatchConstraintsWidget = previousMatchConstraintsWidget;
                firstMatchConstraintsWidget = firstMatchConstraintsWidget;
            } else {
                if (widget2 == firstVisibleWidget) {
                    system.addGreaterThan(begin2.mSolverVariable, begin2.mTarget.mSolverVariable, margin, 6);
                } else {
                    system.addGreaterThan(begin2.mSolverVariable, begin2.mTarget.mSolverVariable, margin, 8);
                }
                if (isSpreadOnly && !isChainPacked) {
                    strength4 = 5;
                }
                if (widget2 == firstVisibleWidget && isChainPacked && widget2.isInBarrier(i2)) {
                    strength3 = 5;
                } else {
                    strength3 = strength4;
                }
                system.addEquality(begin2.mSolverVariable, begin2.mTarget.mSolverVariable, margin, strength3);
            }
            if (isWrapContent) {
                if (widget2.getVisibility() != 8 && widget2.mListDimensionBehaviors[i2] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                    system.addGreaterThan(widget2.mListAnchors[offset + 1].mSolverVariable, widget2.mListAnchors[offset].mSolverVariable, 0, 5);
                }
                system.addGreaterThan(widget2.mListAnchors[offset].mSolverVariable, container.mListAnchors[offset].mSolverVariable, 0, 8);
            }
            ConstraintAnchor nextAnchor = widget2.mListAnchors[offset + 1].mTarget;
            if (nextAnchor != null) {
                ConstraintWidget next4 = nextAnchor.mOwner;
                next3 = (next4.mListAnchors[offset].mTarget == null || next4.mListAnchors[offset].mTarget.mOwner != widget2) ? null : next4;
            } else {
                next3 = null;
            }
            if (next3 != null) {
                widget2 = next3;
            } else {
                done = true;
            }
            totalWeights2 = totalWeights3;
            previousMatchConstraintsWidget = previousMatchConstraintsWidget;
            firstMatchConstraintsWidget = firstMatchConstraintsWidget;
        }
        float totalWeights4 = totalWeights2;
        if (lastVisibleWidget != null && last.mListAnchors[offset + 1].mTarget != null) {
            ConstraintAnchor end3 = lastVisibleWidget.mListAnchors[offset + 1];
            boolean isSpreadOnly2 = lastVisibleWidget.mListDimensionBehaviors[i2] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && lastVisibleWidget.mResolvedMatchConstraintDefault[i2] == 0;
            if (isSpreadOnly2 && !isChainPacked && end3.mTarget.mOwner == container) {
                system.addEquality(end3.mSolverVariable, end3.mTarget.mSolverVariable, -end3.getMargin(), 5);
            } else if (isChainPacked && end3.mTarget.mOwner == container) {
                system.addEquality(end3.mSolverVariable, end3.mTarget.mSolverVariable, -end3.getMargin(), 4);
            }
            system.addLowerThan(end3.mSolverVariable, last.mListAnchors[offset + 1].mTarget.mSolverVariable, -end3.getMargin(), 6);
        }
        if (isWrapContent) {
            system.addGreaterThan(container.mListAnchors[offset + 1].mSolverVariable, last.mListAnchors[offset + 1].mSolverVariable, last.mListAnchors[offset + 1].getMargin(), 8);
        }
        ArrayList<ConstraintWidget> listMatchConstraints2 = chainHead2.mWeightedMatchConstraintsWidgets;
        if (listMatchConstraints2 == null || (count = listMatchConstraints2.size()) <= 1) {
            widget = widget2;
            listMatchConstraints = listMatchConstraints2;
            head = head3;
        } else {
            ConstraintWidget lastMatch = null;
            float lastWeight = 0.0f;
            if (chainHead2.mHasUndefinedWeights && !chainHead2.mHasComplexMatchWeights) {
                totalWeights = chainHead2.mWidgetsMatchCount;
            } else {
                totalWeights = totalWeights4;
            }
            int i3 = 0;
            while (i3 < count) {
                ConstraintWidget match = listMatchConstraints2.get(i3);
                int count2 = count;
                float currentWeight = match.mWeight[i2];
                if (currentWeight < 0.0f) {
                    if (chainHead2.mHasComplexMatchWeights) {
                        widget2 = widget2;
                        listMatchConstraints2 = listMatchConstraints2;
                        system.addEquality(match.mListAnchors[offset + 1].mSolverVariable, match.mListAnchors[offset].mSolverVariable, 0, 4);
                    } else {
                        currentWeight = 1.0f;
                    }
                    i3++;
                    chainHead2 = chainHead;
                    head3 = head3;
                    count = count2;
                    widget2 = widget2;
                    listMatchConstraints2 = listMatchConstraints2;
                }
                if (currentWeight == 0.0f) {
                    system.addEquality(match.mListAnchors[offset + 1].mSolverVariable, match.mListAnchors[offset].mSolverVariable, 0, 8);
                } else {
                    if (lastMatch != null) {
                        SolverVariable begin3 = lastMatch.mListAnchors[offset].mSolverVariable;
                        SolverVariable end4 = lastMatch.mListAnchors[offset + 1].mSolverVariable;
                        SolverVariable nextBegin = match.mListAnchors[offset].mSolverVariable;
                        SolverVariable nextEnd = match.mListAnchors[offset + 1].mSolverVariable;
                        ArrayRow row = system.createRow();
                        row.createRowEqualMatchDimensions(lastWeight, totalWeights, currentWeight, begin3, end4, nextBegin, nextEnd);
                        system.addConstraint(row);
                    }
                    lastMatch = match;
                    lastWeight = currentWeight;
                }
                i3++;
                chainHead2 = chainHead;
                head3 = head3;
                count = count2;
                widget2 = widget2;
                listMatchConstraints2 = listMatchConstraints2;
            }
            widget = widget2;
            listMatchConstraints = listMatchConstraints2;
            head = head3;
        }
        if (firstVisibleWidget != null && (firstVisibleWidget == lastVisibleWidget || isChainPacked)) {
            ConstraintAnchor begin4 = first.mListAnchors[offset];
            ConstraintAnchor end5 = last.mListAnchors[offset + 1];
            SolverVariable beginTarget2 = begin4.mTarget != null ? begin4.mTarget.mSolverVariable : null;
            SolverVariable endTarget2 = end5.mTarget != null ? end5.mTarget.mSolverVariable : null;
            ConstraintAnchor begin5 = firstVisibleWidget.mListAnchors[offset];
            if (lastVisibleWidget == null) {
                end2 = end5;
            } else {
                end2 = lastVisibleWidget.mListAnchors[offset + 1];
            }
            if (beginTarget2 != null && endTarget2 != null) {
                if (i2 == 0) {
                    head2 = head;
                    float bias2 = head2.mHorizontalBiasPercent;
                    bias = bias2;
                } else {
                    head2 = head;
                    float bias3 = head2.mVerticalBiasPercent;
                    bias = bias3;
                }
                int beginMargin = begin5.getMargin();
                int endMargin = end2.getMargin();
                system.addCentering(begin5.mSolverVariable, beginTarget2, beginMargin, bias, endTarget2, end2.mSolverVariable, endMargin, 7);
            }
        } else if (isChainSpread && firstVisibleWidget != null) {
            boolean applyFixedEquality = chainHead.mWidgetsMatchCount > 0 && chainHead.mWidgetsCount == chainHead.mWidgetsMatchCount;
            ConstraintWidget widget3 = firstVisibleWidget;
            ConstraintWidget previousVisibleWidget2 = firstVisibleWidget;
            while (widget3 != null) {
                ConstraintWidget next5 = widget3.mNextChainWidget[i2];
                while (next5 != null && next5.getVisibility() == 8) {
                    next5 = next5.mNextChainWidget[i2];
                }
                if (next5 != null || widget3 == lastVisibleWidget) {
                    ConstraintAnchor beginAnchor = widget3.mListAnchors[offset];
                    SolverVariable begin6 = beginAnchor.mSolverVariable;
                    SolverVariable beginTarget3 = beginAnchor.mTarget != null ? beginAnchor.mTarget.mSolverVariable : null;
                    if (previousVisibleWidget2 != widget3) {
                        beginTarget = previousVisibleWidget2.mListAnchors[offset + 1].mSolverVariable;
                    } else if (widget3 != firstVisibleWidget) {
                        beginTarget = beginTarget3;
                    } else {
                        beginTarget = first.mListAnchors[offset].mTarget != null ? first.mListAnchors[offset].mTarget.mSolverVariable : null;
                    }
                    int beginMargin2 = beginAnchor.getMargin();
                    int nextMargin3 = widget3.mListAnchors[offset + 1].getMargin();
                    if (next5 != null) {
                        ConstraintAnchor beginNextAnchor3 = next5.mListAnchors[offset];
                        SolverVariable beginNext3 = beginNextAnchor3.mSolverVariable;
                        beginNextAnchor2 = beginNextAnchor3;
                        beginNext2 = beginNext3;
                    } else {
                        ConstraintAnchor beginNextAnchor4 = last.mListAnchors[offset + 1].mTarget;
                        if (beginNextAnchor4 == null) {
                            beginNextAnchor2 = beginNextAnchor4;
                            beginNext2 = null;
                        } else {
                            SolverVariable beginNext4 = beginNextAnchor4.mSolverVariable;
                            beginNextAnchor2 = beginNextAnchor4;
                            beginNext2 = beginNext4;
                        }
                    }
                    SolverVariable beginNextTarget2 = widget3.mListAnchors[offset + 1].mSolverVariable;
                    if (beginNextAnchor2 == null) {
                        nextMargin2 = nextMargin3;
                    } else {
                        nextMargin2 = nextMargin3 + beginNextAnchor2.getMargin();
                    }
                    int beginMargin3 = beginMargin2 + previousVisibleWidget2.mListAnchors[offset + 1].getMargin();
                    if (begin6 != null && beginTarget != null && beginNext2 != null && beginNextTarget2 != null) {
                        if (widget3 != firstVisibleWidget) {
                            margin1 = beginMargin3;
                        } else {
                            int margin4 = firstVisibleWidget.mListAnchors[offset].getMargin();
                            margin1 = margin4;
                        }
                        int margin5 = nextMargin2;
                        if (widget3 != lastVisibleWidget) {
                            margin2 = margin5;
                        } else {
                            int margin6 = lastVisibleWidget.mListAnchors[offset + 1].getMargin();
                            margin2 = margin6;
                        }
                        if (!applyFixedEquality) {
                            strength2 = 5;
                        } else {
                            strength2 = 8;
                        }
                        system.addCentering(begin6, beginTarget, margin1, 0.5f, beginNext2, beginNextTarget2, margin2, strength2);
                    }
                }
                if (widget3.getVisibility() == 8) {
                    previousVisibleWidget = previousVisibleWidget2;
                } else {
                    previousVisibleWidget = widget3;
                }
                widget3 = next5;
                previousVisibleWidget2 = previousVisibleWidget;
            }
        } else {
            int i4 = 8;
            if (isChainSpreadInside && firstVisibleWidget != null) {
                boolean applyFixedEquality2 = chainHead.mWidgetsMatchCount > 0 && chainHead.mWidgetsCount == chainHead.mWidgetsMatchCount;
                ConstraintWidget widget4 = firstVisibleWidget;
                ConstraintWidget previousVisibleWidget3 = firstVisibleWidget;
                while (widget4 != null) {
                    ConstraintWidget next6 = widget4.mNextChainWidget[i2];
                    while (next6 != null && next6.getVisibility() == i4) {
                        next6 = next6.mNextChainWidget[i2];
                    }
                    if (widget4 == firstVisibleWidget || widget4 == lastVisibleWidget || next6 == null) {
                        widget4 = widget4;
                        previousVisibleWidget3 = previousVisibleWidget3;
                        i = i4;
                        next = next6;
                    } else {
                        if (next6 != lastVisibleWidget) {
                            next2 = next6;
                        } else {
                            next2 = null;
                        }
                        ConstraintAnchor beginAnchor2 = widget4.mListAnchors[offset];
                        SolverVariable begin7 = beginAnchor2.mSolverVariable;
                        if (beginAnchor2.mTarget != null) {
                            SolverVariable solverVariable = beginAnchor2.mTarget.mSolverVariable;
                        }
                        SolverVariable beginTarget4 = previousVisibleWidget3.mListAnchors[offset + 1].mSolverVariable;
                        SolverVariable beginNext5 = null;
                        int beginMargin4 = beginAnchor2.getMargin();
                        int nextMargin4 = widget4.mListAnchors[offset + 1].getMargin();
                        if (next2 != null) {
                            ConstraintAnchor beginNextAnchor5 = next2.mListAnchors[offset];
                            SolverVariable beginNext6 = beginNextAnchor5.mSolverVariable;
                            beginNextTarget = beginNextAnchor5.mTarget != null ? beginNextAnchor5.mTarget.mSolverVariable : null;
                            beginNext = beginNext6;
                            beginNextAnchor = beginNextAnchor5;
                        } else {
                            ConstraintAnchor beginNextAnchor6 = lastVisibleWidget.mListAnchors[offset];
                            if (beginNextAnchor6 != null) {
                                beginNext5 = beginNextAnchor6.mSolverVariable;
                            }
                            beginNextAnchor = beginNextAnchor6;
                            beginNextTarget = widget4.mListAnchors[offset + 1].mSolverVariable;
                            beginNext = beginNext5;
                        }
                        if (beginNextAnchor == null) {
                            nextMargin = nextMargin4;
                        } else {
                            nextMargin = nextMargin4 + beginNextAnchor.getMargin();
                        }
                        int beginMargin5 = beginMargin4 + previousVisibleWidget3.mListAnchors[offset + 1].getMargin();
                        if (!applyFixedEquality2) {
                            strength = 4;
                        } else {
                            strength = 8;
                        }
                        if (begin7 == null || beginTarget4 == null || beginNext == null || beginNextTarget == null) {
                            i = 8;
                        } else {
                            i = 8;
                            system.addCentering(begin7, beginTarget4, beginMargin5, 0.5f, beginNext, beginNextTarget, nextMargin, strength);
                        }
                        next = next2;
                    }
                    if (widget4.getVisibility() == i) {
                        previousVisibleWidget3 = previousVisibleWidget3;
                    } else {
                        previousVisibleWidget3 = widget4;
                    }
                    widget4 = next;
                    i4 = i;
                    i2 = orientation;
                }
                ConstraintAnchor begin8 = firstVisibleWidget.mListAnchors[offset];
                ConstraintAnchor beginTarget5 = first.mListAnchors[offset].mTarget;
                ConstraintAnchor end6 = lastVisibleWidget.mListAnchors[offset + 1];
                ConstraintAnchor endTarget3 = last.mListAnchors[offset + 1].mTarget;
                if (beginTarget5 == null) {
                    endPointsStrength = 5;
                } else if (firstVisibleWidget != lastVisibleWidget) {
                    system.addEquality(begin8.mSolverVariable, beginTarget5.mSolverVariable, begin8.getMargin(), 5);
                    endPointsStrength = 5;
                } else if (endTarget3 != null) {
                    endPointsStrength = 5;
                    system.addCentering(begin8.mSolverVariable, beginTarget5.mSolverVariable, begin8.getMargin(), 0.5f, end6.mSolverVariable, endTarget3.mSolverVariable, end6.getMargin(), 5);
                } else {
                    endPointsStrength = 5;
                }
                if (endTarget3 != null && firstVisibleWidget != lastVisibleWidget) {
                    system.addEquality(end6.mSolverVariable, endTarget3.mSolverVariable, -end6.getMargin(), endPointsStrength);
                }
            }
        }
        if ((isChainSpread || isChainSpreadInside) && firstVisibleWidget != null && firstVisibleWidget != lastVisibleWidget) {
            ConstraintAnchor begin9 = firstVisibleWidget.mListAnchors[offset];
            if (lastVisibleWidget == 0) {
                lastVisibleWidget = firstVisibleWidget;
            }
            ConstraintAnchor end7 = lastVisibleWidget.mListAnchors[offset + 1];
            SolverVariable beginTarget6 = begin9.mTarget != null ? begin9.mTarget.mSolverVariable : null;
            SolverVariable endTarget4 = end7.mTarget != null ? end7.mTarget.mSolverVariable : null;
            if (last == lastVisibleWidget) {
                endTarget = endTarget4;
            } else {
                ConstraintAnchor realEnd = last.mListAnchors[offset + 1];
                SolverVariable endTarget5 = realEnd.mTarget != null ? realEnd.mTarget.mSolverVariable : null;
                endTarget = endTarget5;
            }
            if (firstVisibleWidget != lastVisibleWidget) {
                begin = begin9;
                end = end7;
            } else {
                begin = firstVisibleWidget.mListAnchors[offset];
                end = firstVisibleWidget.mListAnchors[offset + 1];
            }
            if (beginTarget6 != null && endTarget != null) {
                int beginMargin6 = begin.getMargin();
                int endMargin2 = lastVisibleWidget.mListAnchors[offset + 1].getMargin();
                system.addCentering(begin.mSolverVariable, beginTarget6, beginMargin6, 0.5f, endTarget, end.mSolverVariable, endMargin2, 5);
            }
        }
    }
}
