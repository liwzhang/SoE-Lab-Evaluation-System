import { Abstractlexer } from "./abstractlexer"



class FileLexer extends Abstractlexer{
    constructor(text){
        super(text);
    }

    lex(text)
    {
        if (this.rowNum + this.rowNum > text.length){
            return 'done';
        }
        var character = text.charAt(this.lineNum + this.rowNum);
        while(1){
            if(character == '\n'){
                this.lineNum = 0;
                ++this.rowNumber;
                return 'newline';
            }
            else if (/[\s]/.test(text))
            {
                ++this.lineNum;
            }
            else if(character == ','){
                ++this.lineNum;
                return ',';
            }
            else if(character == '"' || character == "'")
            {
                let cha = character;
                ++this.lineNum;
                character = text.charAt(this.lineNum + this.rowNum);
                while (character != cha && (this.rowNum + this.rowNum < text.length))
                {
                    if (character == '\n')
                    {
                        ++this.rowNumber;
                        this.lineNum = 0;
                    }
                    else{
                        ++this.lineNum;
                    }
                    character = text.charAt(this.lineNum + this.rowNum);
                }
                if (this.rowNum + this.rowNum < text.length)
                {
                    return 'Error'
                }
                ++this.lineNum;
                return 'string'
            }
            else{
                return 'string'
            }
            return 'Error';
        }
    }
}
