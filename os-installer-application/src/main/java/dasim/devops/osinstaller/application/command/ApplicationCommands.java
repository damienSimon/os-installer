package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;
import org.springframework.shell.standard.ShellOption;

import static dasim.devops.osinstaller.application.command.constant.CommandsGroupConstant.APPLICATION;

/**
 * Class for the application's shell command
 */
@ShellComponent
public class ApplicationCommands {

    /**
     * Get the complete list of applications autorized to install no matter the template
     *
     * @return information about process
     */
    @ShellMethod(key = "list --a",
                 group = APPLICATION,
                 value = "Get the complete list of applications autorized to install no matter the template")
    public String list() {

        return "list of applications autorized !";
    }

    /**
     * Add an application to the list of possible application to install and persist it.
     *
     * @param applicationName Name of the application to add (don't use space).
     * @param filePath File path to a json file with the right content structure will be accepted
     * @return information about process
     */
    @ShellMethod(key = "add --a",
                 group = APPLICATION,
                 value = "Add an application to the list of possible application to install and persist it.")
    public String add(
            @ShellOption(value = {"-n", "-name"}, help = "Name of the application to add (don't use space).") String applicationName,
            @ShellOption(value = {"-f", "-file"}, help = "File path to a json file with the right content structure will be accepted")
                    String filePath) {

        return "application " + applicationName + " added from file " + filePath + " !";
    }

    /**
     * Add an application to the list of possible application to install and persist it.
     *
     * @param applicationName Name of the application to add (don't use space).
     * @param noConfirmation Delete the application without asking a confirmation.
     * @return information about process
     */
    @ShellMethod(key = "delete --a",
                 group = APPLICATION,
                 value = "Delete an application to the list of possible application to install and persist it.")
    public String delete(
            @ShellOption(value = {"-n", "-name"}, help = "Name of the application to add (don't use space).") String applicationName,
            @ShellOption(value = "-y", help = "Delete the application without asking a confirmation.") boolean noConfirmation) {

        return "Are you sure to delete application " + applicationName + " ? ";
    }
}
