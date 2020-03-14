package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;

import static dasim.devops.osinstaller.application.command.constant.CommandsGroupConstant.SESSION;

/**
 * Class for the session's shell command
 */
@ShellComponent
public class SessionCommands {

    /**
     * Allow to reset the shell with no template loaded. All modifications will be lost !
     *
     * @return information about process
     */
    @ShellMethod(group = SESSION, value = "Allow to reset the shell with no template loaded. All modifications will be lost !")
    public String reset() {

        return "no template loaded !";
    }

    /**
     * Get all logs of your session
     *
     * @return information about process
     */
    @ShellMethod(group = SESSION, value = "Get all logs of your session")
    public String log() {

        return "Trying to find the bullshit... ?";
    }

    /**
     * Get history of typed commands
     *
     * @return information about process
     */
    @ShellMethod(group = SESSION, value = "Get history of typed commands")
    public String history() {

        return "display content of file os-installer-server.log";
    }

    /**
     * Get all logs of your session
     *
     * @return information about process
     */
    @ShellMethod(group = SESSION, value = "Get all informations of your session")
    public String info() {

        return "{\n" + //
                "  templateName : xxx,\n" + //
                "  isModified : false,\n" + //
                "  applicationsNumber : 8,\n" + //
                "  applications : {\n" + //
                "    docker : {\n" + //
                "      version : 1.x.y\n" + //
                "    }\n" + //
                "  }\n" + //
                "}\n";
    }
}
