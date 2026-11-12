package fr.castorflex.android.smoothprogressbar;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.shapes.Shape;

/* JADX INFO: loaded from: classes.dex */
public class ColorsShape extends Shape {
    private int[] mColors;
    private float mStrokeWidth;

    public ColorsShape(float strokeWidth, int[] colors) {
        this.mStrokeWidth = strokeWidth;
        this.mColors = colors;
    }

    public float getStrokeWidth() {
        return this.mStrokeWidth;
    }

    public void setStrokeWidth(float strokeWidth) {
        this.mStrokeWidth = strokeWidth;
    }

    public int[] getColors() {
        return this.mColors;
    }

    public void setColors(int[] colors) {
        this.mColors = colors;
    }

    @Override // android.graphics.drawable.shapes.Shape
    public void draw(Canvas canvas, Paint paint) {
        float ratio = 1.0f / this.mColors.length;
        int i = 0;
        paint.setStrokeWidth(this.mStrokeWidth);
        int[] iArr = this.mColors;
        int length = iArr.length;
        int i2 = 0;
        while (i2 < length) {
            int color = iArr[i2];
            paint.setColor(color);
            int i3 = i + 1;
            canvas.drawLine(i * ratio * getWidth(), getHeight() / 2.0f, getWidth() * i3 * ratio, getHeight() / 2.0f, paint);
            i2++;
            i = i3;
        }
    }
}
