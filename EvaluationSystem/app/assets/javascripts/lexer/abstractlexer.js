

class Abstractlexer{
    constructor(file){
        this.file = file;
        this.lineNum = 0;
        this.rowNum = 0;
    }

    get lineNumber()
    {
        return this.lineNum;
    }

    get rowNumber()
    {
        return this.lineNum;
    }

    lex()
    {
        return 0;
    }

}

export { Abstractlexer }