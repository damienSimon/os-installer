package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;
import org.springframework.shell.standard.ShellOption;

import static dasim.devops.osinstaller.application.command.constant.CommandsGroupConstant.TEMPLATE_CONTENT;

/**
 * Class for the template's content shell command
 */
@ShellComponent
public class TemplateContentCommands {

    /**
     * Get the complete list of applications contained in the current template
     *
     * @return information about process
     */
    @ShellMethod(key = TEMPLATE_CONTENT,
                 group = "Template content commands",
                 value = "Get the complete list of applications contained in the template")
    public String listApplicationsFromCurrentTemplate() {

        return "list of applications contained in the current template : {}";
    }

    /**
     * Get the complete list of applications contained in a specific template
     *
     * @param templateName name of the template
     * @return information about process
     */
    @ShellMethod(key = "listfrom", group = TEMPLATE_CONTENT, value = "Get the complete list of applications contained in the template")
    public String listApplicationsFromASpecificTemplate(@ShellOption(value = "-n", help = "name of the template") String templateName) {

        return "list of applications contained in the template " + templateName + " : {}";
    }

    /**
     * Add an application to the current template
     *
     * @param applicationToAddToTheCurrentTemplate name of the application to add to the current template
     * @return information about process
     */
    @ShellMethod(group = TEMPLATE_CONTENT, value = "Add an application to the current template.")
    public String add(@ShellOption(value = "-n", help = "name of the application to add to the current template")
            String applicationToAddToTheCurrentTemplate) {

        return "application " + applicationToAddToTheCurrentTemplate + " added to the current template !";
    }

    /**
     * Delete an application from the current template
     *
     * @param applicationToDeleteFromTheCurrentTemplate name of the application to delete from the current template
     * @return information about process
     */
    @ShellMethod(key = "delete", group = TEMPLATE_CONTENT, value = "Delete an application from the current template.")
    public String deleteApplicationFromTemplate(
            @ShellOption(value = "-n", help = "name of the application to delete from the current template")
                    String applicationToDeleteFromTheCurrentTemplate) {

        return "application " + applicationToDeleteFromTheCurrentTemplate + " added to the current template !";
    }

}
