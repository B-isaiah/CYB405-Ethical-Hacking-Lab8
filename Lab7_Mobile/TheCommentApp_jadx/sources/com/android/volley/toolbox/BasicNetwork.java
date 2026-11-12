package com.android.volley.toolbox;

import com.android.volley.Header;
import com.android.volley.Network;
import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;

/* JADX INFO: loaded from: classes.dex */
public class BasicNetwork implements Network {
    private static final int DEFAULT_POOL_SIZE = 4096;
    private final BaseHttpStack mBaseHttpStack;

    @Deprecated
    protected final HttpStack mHttpStack;
    protected final ByteArrayPool mPool;

    @Deprecated
    public BasicNetwork(HttpStack httpStack) {
        this(httpStack, new ByteArrayPool(4096));
    }

    @Deprecated
    public BasicNetwork(HttpStack httpStack, ByteArrayPool pool) {
        this.mHttpStack = httpStack;
        this.mBaseHttpStack = new AdaptedHttpStack(httpStack);
        this.mPool = pool;
    }

    public BasicNetwork(BaseHttpStack httpStack) {
        this(httpStack, new ByteArrayPool(4096));
    }

    public BasicNetwork(BaseHttpStack httpStack, ByteArrayPool pool) {
        this.mBaseHttpStack = httpStack;
        this.mHttpStack = httpStack;
        this.mPool = pool;
    }

    /* JADX WARN: Code restructure failed: missing block: B:4:0x000f, code lost:
    
        r0 = com.android.volley.toolbox.HttpHeaderParser.getCacheHeaders(r22.getCacheEntry());
        r5 = r21.mBaseHttpStack.executeRequest(r22, r0);
        r5 = r5.getStatusCode();
        r6 = r5.getHeaders();
     */
    @Override // com.android.volley.Network
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.android.volley.NetworkResponse performRequest(com.android.volley.Request<?> r22) throws com.android.volley.VolleyError {
        /*
            r21 = this;
            r1 = r21
            r8 = r22
            long r9 = android.os.SystemClock.elapsedRealtime()
        L8:
            r2 = 0
            r3 = 0
            java.util.List r4 = java.util.Collections.emptyList()
            com.android.volley.Cache$Entry r0 = r22.getCacheEntry()     // Catch: java.io.IOException -> L7e
            java.util.Map r0 = com.android.volley.toolbox.HttpHeaderParser.getCacheHeaders(r0)     // Catch: java.io.IOException -> L7e
            com.android.volley.toolbox.BaseHttpStack r5 = r1.mBaseHttpStack     // Catch: java.io.IOException -> L7e
            com.android.volley.toolbox.HttpResponse r5 = r5.executeRequest(r8, r0)     // Catch: java.io.IOException -> L7e
            r2 = r5
            int r5 = r2.getStatusCode()     // Catch: java.io.IOException -> L7e
            java.util.List r6 = r2.getHeaders()     // Catch: java.io.IOException -> L7e
            r4 = r6
            r6 = 304(0x130, float:4.26E-43)
            if (r5 != r6) goto L35
            long r6 = android.os.SystemClock.elapsedRealtime()     // Catch: java.io.IOException -> L7e
            long r6 = r6 - r9
            com.android.volley.NetworkResponse r11 = com.android.volley.toolbox.NetworkUtility.getNotModifiedNetworkResponse(r8, r6, r4)     // Catch: java.io.IOException -> L7e
            return r11
        L35:
            java.io.InputStream r6 = r2.getContent()     // Catch: java.io.IOException -> L7e
            if (r6 == 0) goto L48
        L3c:
            int r7 = r2.getContentLength()     // Catch: java.io.IOException -> L7e
            com.android.volley.toolbox.ByteArrayPool r11 = r1.mPool     // Catch: java.io.IOException -> L7e
            byte[] r7 = com.android.volley.toolbox.NetworkUtility.inputStreamToBytes(r6, r7, r11)     // Catch: java.io.IOException -> L7e
            r3 = r7
            goto L4c
        L48:
            r7 = 0
            byte[] r7 = new byte[r7]     // Catch: java.io.IOException -> L7e
            r3 = r7
        L4c:
            long r11 = android.os.SystemClock.elapsedRealtime()     // Catch: java.io.IOException -> L7e
            long r14 = r11 - r9
            com.android.volley.toolbox.NetworkUtility.logSlowRequests(r14, r8, r3, r5)     // Catch: java.io.IOException -> L7e
            r7 = 200(0xc8, float:2.8E-43)
            if (r5 < r7) goto L76
            r7 = 299(0x12b, float:4.19E-43)
            if (r5 > r7) goto L76
            com.android.volley.NetworkResponse r7 = new com.android.volley.NetworkResponse     // Catch: java.io.IOException -> L7e
            r16 = 0
            long r11 = android.os.SystemClock.elapsedRealtime()     // Catch: java.io.IOException -> L7e
            long r17 = r11 - r9
            r11 = r7
            r12 = r5
            r13 = r3
            r19 = r14
            r14 = r16
            r15 = r17
            r17 = r4
            r11.<init>(r12, r13, r14, r15, r17)     // Catch: java.io.IOException -> L7e
            return r7
        L76:
            r19 = r14
            java.io.IOException r7 = new java.io.IOException     // Catch: java.io.IOException -> L7e
            r7.<init>()     // Catch: java.io.IOException -> L7e
            throw r7     // Catch: java.io.IOException -> L7e
        L7e:
            r0 = move-exception
            r11 = r3
            r12 = r4
            r3 = r0
            r0 = r2
            r2 = r22
            r4 = r9
            r6 = r0
            r7 = r11
            com.android.volley.toolbox.NetworkUtility$RetryInfo r2 = com.android.volley.toolbox.NetworkUtility.shouldRetryException(r2, r3, r4, r6, r7)
            com.android.volley.toolbox.NetworkUtility.attemptRetryOnException(r8, r2)
            goto L8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.volley.toolbox.BasicNetwork.performRequest(com.android.volley.Request):com.android.volley.NetworkResponse");
    }

    @Deprecated
    protected static Map<String, String> convertHeaders(Header[] headers) {
        Map<String, String> result = new TreeMap<>((Comparator<? super String>) String.CASE_INSENSITIVE_ORDER);
        for (int i = 0; i < headers.length; i++) {
            result.put(headers[i].getName(), headers[i].getValue());
        }
        return result;
    }
}
