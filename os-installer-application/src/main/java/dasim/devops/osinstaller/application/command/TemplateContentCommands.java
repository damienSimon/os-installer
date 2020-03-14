package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;
import org.springframework.shell.standard.ShellOption;

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
    @ShellMethod(key = "list",
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
    @ShellMethod(key = "listfrom",
                 group = "Template content commands",
                 value = "Get the complete list of applications contained in the template")
    public String listApplicationsFromASpecificTemplate(@ShellOption(value = "-n", help = "name of the template") String templateName) {

        return "list of applications contained in the template " + templateName + " : {}";
    }

    /**
     * Add an application to the current template
     *
     * @param applicationToAddToTheCurrentTemplate name of the application to add to the current template
     * @return information about process
     */
    @ShellMethod(group = "Template content commands", value = "Add an application to the current template.")
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
    @ShellMethod(key = "delete", group = "Template content commands", value = "Delete an application from the current template.")
    public String deleteApplicationFromTemplate(
            @ShellOption(value = "-n", help = "name of the application to delete from the current template")
                    String applicationToDeleteFromTheCurrentTemplate) {

        return "application " + applicationToDeleteFromTheCurrentTemplate + " added to the current template !";
    }

}
