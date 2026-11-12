package androidx.constraintlayout.core.parser;

/* JADX INFO: loaded from: classes.dex */
public class CLParser {
    static boolean DEBUG = false;
    private boolean hasComment = false;
    private int lineNumber;
    private String mContent;

    enum TYPE {
        UNKNOWN,
        OBJECT,
        ARRAY,
        NUMBER,
        STRING,
        KEY,
        TOKEN
    }

    public static CLObject parse(String string) throws CLParsingException {
        return new CLParser(string).parse();
    }

    public CLParser(String content) {
        this.mContent = content;
    }

    /* JADX WARN: Code duplicated, block: B:120:0x0054 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:121:0x00cc A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:25:0x0057  */
    /* JADX WARN: Code duplicated, block: B:27:0x005d  */
    /* JADX WARN: Code duplicated, block: B:28:0x0066  */
    /* JADX WARN: Code duplicated, block: B:30:0x006c A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:31:0x006e  */
    /* JADX WARN: Code duplicated, block: B:32:0x0079  */
    /* JADX WARN: Code duplicated, block: B:33:0x0082  */
    /* JADX WARN: Code duplicated, block: B:35:0x0088 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:36:0x008a  */
    /* JADX WARN: Code duplicated, block: B:37:0x0095  */
    /* JADX WARN: Code duplicated, block: B:38:0x009e  */
    /* JADX WARN: Code duplicated, block: B:40:0x00a4  */
    /* JADX WARN: Code duplicated, block: B:42:0x00ab  */
    /* JADX WARN: Code duplicated, block: B:44:0x00bc  */
    /* JADX WARN: Code duplicated, block: B:46:0x00c0  */
    /* JADX WARN: Code duplicated, block: B:51:0x00f1  */
    /* JADX WARN: Code duplicated, block: B:69:0x0124  */
    /* JADX WARN: Code duplicated, block: B:84:0x0141  */
    /* JADX WARN: Code duplicated, block: B:87:0x014b A[ADDED_TO_REGION] */
    /* JADX WARN: Code duplicated, block: B:88:0x014d  */
    /* JADX WARN: Code duplicated, block: B:90:0x015b  */
    /* JADX WARN: Code duplicated, block: B:91:0x0166  */
    public CLObject parse() throws CLParsingException {
        char c;
        char ck;
        char c2;
        CLToken token;
        char[] content = this.mContent.toCharArray();
        int length = content.length;
        int i = 1;
        this.lineNumber = 1;
        int startIndex = -1;
        int i2 = 0;
        while (true) {
            c = '\n';
            if (i2 >= length) {
                break;
            }
            char c3 = content[i2];
            if (c3 == '{') {
                startIndex = i2;
                break;
            }
            if (c3 == '\n') {
                this.lineNumber++;
            }
            i2++;
        }
        if (startIndex == -1) {
            throw new CLParsingException("invalid json content", null);
        }
        CLObject root = CLObject.allocate(content);
        root.setLine(this.lineNumber);
        root.setStart(startIndex);
        CLElement currentElement = root;
        int i3 = startIndex + 1;
        while (i3 < length) {
            char c4 = content[i3];
            if (c4 == c) {
                this.lineNumber += i;
            }
            if (this.hasComment) {
                if (c4 == c) {
                    this.hasComment = false;
                    if (currentElement == null) {
                        break;
                        break;
                    }
                    if (currentElement.isDone()) {
                        currentElement = getNextJsonElement(i3, c4, currentElement, content);
                        startIndex = startIndex;
                        c2 = c;
                    } else if (currentElement instanceof CLObject) {
                        if (c4 == '}') {
                            currentElement.setEnd(i3 - 1);
                            startIndex = startIndex;
                            c2 = c;
                        } else {
                            currentElement = getNextJsonElement(i3, c4, currentElement, content);
                            startIndex = startIndex;
                            c2 = c;
                        }
                    } else if (currentElement instanceof CLArray) {
                        if (c4 == ']') {
                            currentElement.setEnd(i3 - 1);
                            startIndex = startIndex;
                            c2 = c;
                        } else {
                            currentElement = getNextJsonElement(i3, c4, currentElement, content);
                            startIndex = startIndex;
                            c2 = c;
                        }
                    } else if (currentElement instanceof CLString) {
                        if (content[(int) currentElement.start] == c4) {
                            currentElement.setStart(currentElement.start + 1);
                            currentElement.setEnd(i3 - 1);
                        }
                        startIndex = startIndex;
                        c2 = c;
                    } else {
                        if (currentElement instanceof CLToken) {
                            token = (CLToken) currentElement;
                            if (!token.validate(c4, i3)) {
                                throw new CLParsingException("parsing incorrect token " + token.content() + " at line " + this.lineNumber, token);
                            }
                        }
                        if (!(currentElement instanceof CLKey)) {
                            currentElement.setStart(currentElement.start + 1);
                            currentElement.setEnd(i3 - 1);
                        } else {
                            currentElement.setStart(currentElement.start + 1);
                            currentElement.setEnd(i3 - 1);
                        }
                        if (!currentElement.isDone()) {
                            c2 = '\n';
                        } else if (c4 != 125) {
                            c2 = '\n';
                            currentElement.setEnd(i3 - 1);
                            if (c4 != 125) {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                                if (currentElement instanceof CLKey) {
                                    currentElement = currentElement.getContainer();
                                    currentElement.setEnd(i3 - 1);
                                }
                            } else {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                                if (currentElement instanceof CLKey) {
                                    currentElement = currentElement.getContainer();
                                    currentElement.setEnd(i3 - 1);
                                }
                            }
                        } else {
                            c2 = '\n';
                            currentElement.setEnd(i3 - 1);
                            if (c4 != 125) {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                                if (currentElement instanceof CLKey) {
                                    currentElement = currentElement.getContainer();
                                    currentElement.setEnd(i3 - 1);
                                }
                            } else {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                                if (currentElement instanceof CLKey) {
                                    currentElement = currentElement.getContainer();
                                    currentElement.setEnd(i3 - 1);
                                }
                            }
                        }
                    }
                    if (!currentElement.isDone()) {
                    }
                } else {
                    startIndex = startIndex;
                    c2 = c;
                }
            } else {
                if (currentElement == null) {
                    break;
                }
                if (currentElement.isDone()) {
                    currentElement = getNextJsonElement(i3, c4, currentElement, content);
                    startIndex = startIndex;
                    c2 = c;
                } else if (currentElement instanceof CLObject) {
                    if (c4 == '}') {
                        currentElement.setEnd(i3 - 1);
                        startIndex = startIndex;
                        c2 = c;
                    } else {
                        currentElement = getNextJsonElement(i3, c4, currentElement, content);
                        startIndex = startIndex;
                        c2 = c;
                    }
                } else if (currentElement instanceof CLArray) {
                    if (c4 == ']') {
                        currentElement.setEnd(i3 - 1);
                        startIndex = startIndex;
                        c2 = c;
                    } else {
                        currentElement = getNextJsonElement(i3, c4, currentElement, content);
                        startIndex = startIndex;
                        c2 = c;
                    }
                } else if (currentElement instanceof CLString) {
                    if (content[(int) currentElement.start] == c4) {
                        currentElement.setStart(currentElement.start + 1);
                        currentElement.setEnd(i3 - 1);
                    }
                    startIndex = startIndex;
                    c2 = c;
                } else {
                    if (currentElement instanceof CLToken) {
                        token = (CLToken) currentElement;
                        if (!token.validate(c4, i3)) {
                            throw new CLParsingException("parsing incorrect token " + token.content() + " at line " + this.lineNumber, token);
                        }
                    }
                    if ((!(currentElement instanceof CLKey) || (currentElement instanceof CLString)) && (((ck = content[(int) currentElement.start]) == '\'' || ck == '\"') && ck == c4)) {
                        currentElement.setStart(currentElement.start + 1);
                        currentElement.setEnd(i3 - 1);
                    }
                    if (!currentElement.isDone()) {
                        c2 = '\n';
                    } else {
                        if (c4 != 125 || c4 == 93 || c4 == 44 || c4 == 32 || c4 == 9 || c4 == 13) {
                            c2 = '\n';
                        } else {
                            c2 = '\n';
                            if (c4 == 10 || c4 == ':') {
                            }
                        }
                        currentElement.setEnd(i3 - 1);
                        if (c4 != 125 || c4 == 93) {
                            currentElement = currentElement.getContainer();
                            currentElement.setEnd(i3 - 1);
                            if (currentElement instanceof CLKey) {
                                currentElement = currentElement.getContainer();
                                currentElement.setEnd(i3 - 1);
                            }
                        }
                    }
                }
                if (!currentElement.isDone() && (!(currentElement instanceof CLKey) || ((CLKey) currentElement).mElements.size() > 0)) {
                    currentElement = currentElement.getContainer();
                }
            }
            i3++;
            c = c2;
            startIndex = startIndex;
            i = 1;
        }
        while (currentElement != null && !currentElement.isDone()) {
            if (currentElement instanceof CLString) {
                currentElement.setStart(((int) currentElement.start) + 1);
            }
            currentElement.setEnd(length - 1);
            currentElement = currentElement.getContainer();
        }
        if (DEBUG) {
            System.out.println("Root: " + root.toJSON());
        }
        return root;
    }

    private CLElement getNextJsonElement(int position, char c, CLElement currentElement, char[] content) throws CLParsingException {
        if (c == '\t' || c == '\n' || c == '\r' || c == ' ') {
            return currentElement;
        }
        if (c == '\"' || c == '\'') {
            if (currentElement instanceof CLObject) {
                return createElement(currentElement, position, TYPE.KEY, true, content);
            }
            return createElement(currentElement, position, TYPE.STRING, true, content);
        }
        if (c == '[') {
            return createElement(currentElement, position, TYPE.ARRAY, true, content);
        }
        if (c != ']') {
            if (c == '{') {
                return createElement(currentElement, position, TYPE.OBJECT, true, content);
            }
            if (c != '}') {
                switch (c) {
                    case '+':
                    case '-':
                    case '.':
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                        return createElement(currentElement, position, TYPE.NUMBER, true, content);
                    case ',':
                    case ':':
                        return currentElement;
                    case '/':
                        if (position + 1 < content.length && content[position + 1] == '/') {
                            this.hasComment = true;
                            return currentElement;
                        }
                        return currentElement;
                    default:
                        if ((currentElement instanceof CLContainer) && !(currentElement instanceof CLObject)) {
                            CLElement currentElement2 = createElement(currentElement, position, TYPE.TOKEN, true, content);
                            CLToken token = (CLToken) currentElement2;
                            if (!token.validate(c, position)) {
                                throw new CLParsingException("incorrect token <" + c + "> at line " + this.lineNumber, token);
                            }
                            return currentElement2;
                        }
                        return createElement(currentElement, position, TYPE.KEY, true, content);
                }
            }
        }
        currentElement.setEnd(position - 1);
        CLElement currentElement3 = currentElement.getContainer();
        currentElement3.setEnd(position);
        return currentElement3;
    }

    private CLElement createElement(CLElement currentElement, int position, TYPE type, boolean applyStart, char[] content) {
        CLElement newElement = null;
        if (DEBUG) {
            System.out.println("CREATE " + type + " at " + content[position]);
        }
        switch (AnonymousClass1.$SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE[type.ordinal()]) {
            case 1:
                newElement = CLObject.allocate(content);
                position++;
                break;
            case 2:
                newElement = CLArray.allocate(content);
                position++;
                break;
            case 3:
                newElement = CLString.allocate(content);
                break;
            case 4:
                newElement = CLNumber.allocate(content);
                break;
            case 5:
                newElement = CLKey.allocate(content);
                break;
            case 6:
                newElement = CLToken.allocate(content);
                break;
        }
        if (newElement == null) {
            return null;
        }
        newElement.setLine(this.lineNumber);
        if (applyStart) {
            newElement.setStart(position);
        }
        if (currentElement instanceof CLContainer) {
            CLContainer container = (CLContainer) currentElement;
            newElement.setContainer(container);
        }
        return newElement;
    }

    /* JADX INFO: renamed from: androidx.constraintlayout.core.parser.CLParser$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE;

        static {
            int[] iArr = new int[TYPE.values().length];
            $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE = iArr;
            try {
                iArr[TYPE.OBJECT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE[TYPE.ARRAY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE[TYPE.STRING.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE[TYPE.NUMBER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE[TYPE.KEY.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$androidx$constraintlayout$core$parser$CLParser$TYPE[TYPE.TOKEN.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }
}
