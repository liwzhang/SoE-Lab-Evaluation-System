import { Abstractlexer } from "./abstractlexer"



class FileLexer extends Abstractlexer{
    constructor(text){
        super(text);
    }

    lex(text)
    {
        if (this.rowNum + this.rowNum > text.length){
            return 'done'
        }
        var character = text.charAt(this.lineNum + this.rowNum)
        while(1){
            if(character == '\n'){
                this.lineNum = 0;
                this.rowNumber++;
            }
            else if (/[^\s]/.test(text))
            {
                ++this.lineNum;
            }
            else if(character == ','){
                this.lineNum++;
                return ','
            }
            
        return "string"
        }
    }
}
