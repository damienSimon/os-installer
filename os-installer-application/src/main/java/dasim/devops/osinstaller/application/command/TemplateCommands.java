package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;
import org.springframework.shell.standard.ShellOption;

/**
 * Class for the template's shell command
 */
@ShellComponent
public class TemplateCommands {

    /**
     * Load a template which contains a list of applications to install on OS
     *
     * @param templateName name of the template
     * @return information about process
     */
    @ShellMethod("load a template which contains a list of application to install")
    public String load(@ShellOption String templateName) {

        return "template " + templateName + " loaded !";
    }
}
