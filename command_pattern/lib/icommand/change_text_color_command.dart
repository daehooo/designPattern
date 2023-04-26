// 색바꾸는 클래스
class ChangeTextColorCommand implements ICommand {
    final Function changeColor;

    ChangeTextColorCommand(this.changeColor);

    @override
    void execute(){
        changeColor();
    }

}