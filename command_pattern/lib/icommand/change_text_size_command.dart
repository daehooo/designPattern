// 사이즈 바꾸는 클래스
class ChangeTextSizeCommand implements ICommand {
    final Function changeSize;

    ChangeTextColorCommand(this.changeColor);

    @override
    void execute(){
        changeSize();
    }
}