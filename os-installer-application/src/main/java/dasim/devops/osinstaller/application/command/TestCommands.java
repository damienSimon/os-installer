package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;

import static dasim.devops.osinstaller.application.command.constant.CommandsGroupConstant.TEST;

/**
 * Class for the test's shell command
 */
@ShellComponent
public class TestCommands {

    /**
     * Test the installation of selected applications from the current template in a virtual machine. No impact on your operating.
     *
     * @return information about process
     */
    @ShellMethod(group = TEST,
                 value = "Test the installation of selected applications from the current template in a virtual machine. No impact on " +
                         "your operating." + "system.")
    public String test() {

        return "Need to verify ? you are on the right place dude !";
    }
}
