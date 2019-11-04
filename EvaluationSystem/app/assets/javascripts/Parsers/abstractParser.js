
class AbstractParser{
    constructor(text, lexer){
        this.text = text;
        this.currentItem;
        this.lexer = lexer;
    }

    match(item){
        if(item != currentItem){
            throw Error("it's Not right");
        }
        this.currentItem = lexer.lex();

    }

}