package dasim.devops.osinstaller.infrastructure.storage.json;

import lombok.Builder;
import lombok.Getter;

/**
 * Class which describes installation script of an application in json format
 */
@Builder
@Getter
public class ScriptJson {

    private String[] bashCommands;

}
