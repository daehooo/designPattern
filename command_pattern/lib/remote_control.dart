class RemoteControl {
    ICommand? command;

    void setCommand(ICommand cmd) {
        command = cmd;
    }
    void pressButton(){
        command?.execute();
    }
}