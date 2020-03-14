package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;
import org.springframework.shell.standard.ShellOption;

import static dasim.devops.osinstaller.application.command.constant.CommandsGroupConstant.TEMPLATE;

/**
 * Class for the template's shell command
 */
@ShellComponent
public class TemplateCommands {

    /**
     * Load a template which contains a list of applications to install on OS. All modifications done before will be lost !
     *
     * @param templateName name of the template
     * @return information about process
     */
    @ShellMethod(group = TEMPLATE,
                 value = "load a template which contains a list of application to install on OS. All modifications done before will be " +
                         "lost !")
    public String load(@ShellOption(value = "-n", help = "name of the template") String templateName) {

        return "template " + templateName + " loaded !";
    }

    /**
     * Create a new template with the given name and no applications.
     *
     * @param newTemplateName name of the new template
     * @return information about process
     */
    @ShellMethod(group = TEMPLATE, value = "Create a new template with the name given and no applications.")
    public String create(@ShellOption(value = "-n", help = "name of the new template") String newTemplateName) {

        return "template " + newTemplateName + " created !";
    }

    /**
     * Delete the template with the given name
     *
     * @param templateNameToDelete name of the template to delete
     * @return information about process
     */
    @ShellMethod(key = "delete --t", group = TEMPLATE, value = "Delete the template with the given name.")
    public String deleteTemplate(@ShellOption(value = "-n", help = "name of the template to delete") String templateNameToDelete) {

        return "template " + templateNameToDelete + " deleted !";
    }

    /**
     * Start to install all the applications listed in the current template on your operating system. No automatic rollback will be possible
     * !
     *
     * @param noConfirmation Launch installation of all applications without asking a confirmation.
     * @return information about process
     */
    @ShellMethod(group = TEMPLATE,
                 value = "Start to install all the applications listed in the current template on your operating system. No automatic " +
                         "rollback will be possible !")
    public String start(@ShellOption(value = "-y", help = "Launch installation of all applications without asking a confirmation.")
            boolean noConfirmation) {

        return "Be carefull, no automatic rollback will be possible ! Are you sure to want to install all the applications listed in the " +
                "current template on your operating system ? ";
    }

    /**
     * Get the list of existing templates
     *
     * @return information about process
     */
    @ShellMethod(key = "list --t", group = TEMPLATE, value = "Get the list of existing templates")
    public String listTemplates() {

        return "list of existing templates : xxx";
    }

    /**
     * Save the current template with his list of applications
     *
     * @param templateName name of the template
     * @return information about process
     */
    @ShellMethod(key = "save", group = TEMPLATE, value = "Save the current template with his list of applications")
    public String save(@ShellOption(value = "-n", help = "name of the template") String templateName) {

        return "template " + templateName + " saved !";
    }

}
