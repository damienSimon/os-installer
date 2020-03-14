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
    @ShellMethod(group = "Template commands", value = "load a template which contains a list of application to install")
    public String load(@ShellOption String templateName) {

        return "template " + templateName + " loaded !";
    }

    /**
     * Allow to reset the shell with no template loaded
     *
     * @return information about process
     */
    @ShellMethod(group = "Template commands", value = "allow to reset the shell with no template loaded")
    public String reset() {

        return "no template loaded !";
    }

    /**
     * Create a new template with the name given and no applications.
     *
     * @param newTemplateName name of the template
     * @return information about process
     */
    @ShellMethod(group = "Template commands", value = "Create a new template with the name given and no applications.")
    public String create(@ShellOption String newTemplateName) {

        return "template " + newTemplateName + " created !";
    }

}
