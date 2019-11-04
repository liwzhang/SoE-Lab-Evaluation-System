

class Abstractlexer{
    constructor(file){
        this.file = file;
        this.lineNum = 0;
        this.rowNum = 0;
    }

    lex()
    {
        return 0;
    }

}

export { Abstractlexer }