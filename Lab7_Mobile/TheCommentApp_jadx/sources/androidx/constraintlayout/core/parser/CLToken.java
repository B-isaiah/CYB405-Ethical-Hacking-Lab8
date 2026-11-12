package androidx.constraintlayout.core.parser;

/* JADX INFO: loaded from: classes.dex */
public class CLToken extends CLElement {
    int index;
    char[] tokenFalse;
    char[] tokenNull;
    char[] tokenTrue;
    Type type;

    enum Type {
        UNKNOWN,
        TRUE,
        FALSE,
        NULL
    }

    public boolean getBoolean() throws CLParsingException {
        if (this.type == Type.TRUE) {
            return true;
        }
        if (this.type == Type.FALSE) {
            return false;
        }
        throw new CLParsingException("this token is not a boolean: <" + content() + ">", this);
    }

    public boolean isNull() throws CLParsingException {
        if (this.type == Type.NULL) {
            return true;
        }
        throw new CLParsingException("this token is not a null: <" + content() + ">", this);
    }

    public CLToken(char[] content) {
        super(content);
        this.index = 0;
        this.type = Type.UNKNOWN;
        this.tokenTrue = "true".toCharArray();
        this.tokenFalse = "false".toCharArray();
        this.tokenNull = "null".toCharArray();
    }

    public static CLElement allocate(char[] content) {
        return new CLToken(content);
    }

    @Override // androidx.constraintlayout.core.parser.CLElement
    protected String toJSON() {
        if (CLParser.DEBUG) {
            return "<" + content() + ">";
        }
        return content();
    }

    @Override // androidx.constraintlayout.core.parser.CLElement
    protected String toFormattedJSON(int indent, int forceIndent) {
        StringBuilder json = new StringBuilder();
        addIndent(json, indent);
        json.append(content());
        return json.toString();
    }

    public Type getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: androidx.constraintlayout.core.parser.CLToken$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$androidx$constraintlayout$core$parser$CLToken$Type;

        static {
            int[] iArr = new int[Type.values().length];
            $SwitchMap$androidx$constraintlayout$core$parser$CLToken$Type = iArr;
            try {
                iArr[Type.TRUE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLToken$Type[Type.FALSE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLToken$Type[Type.NULL.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLToken$Type[Type.UNKNOWN.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    public boolean validate(char c, long position) {
        boolean isValid = false;
        int i = AnonymousClass1.$SwitchMap$androidx$constraintlayout$core$parser$CLToken$Type[this.type.ordinal()];
        if (i == 1) {
            isValid = this.tokenTrue[this.index] == c;
            if (isValid && this.index + 1 == this.tokenTrue.length) {
                setEnd(position);
            }
        } else if (i == 2) {
            isValid = this.tokenFalse[this.index] == c;
            if (isValid && this.index + 1 == this.tokenFalse.length) {
                setEnd(position);
            }
        } else if (i == 3) {
            isValid = this.tokenNull[this.index] == c;
            if (isValid && this.index + 1 == this.tokenNull.length) {
                setEnd(position);
            }
        } else if (i == 4) {
            char[] cArr = this.tokenTrue;
            int i2 = this.index;
            if (cArr[i2] == c) {
                this.type = Type.TRUE;
                isValid = true;
            } else if (this.tokenFalse[i2] == c) {
                this.type = Type.FALSE;
                isValid = true;
            } else if (this.tokenNull[i2] == c) {
                this.type = Type.NULL;
                isValid = true;
            }
        }
        this.index++;
        return isValid;
    }
}
