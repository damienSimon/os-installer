package dasim.devops.osinstaller.infrastructure.storage.object;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

/**
 * Class which describes an application in json format
 */
@Builder
@Getter
public class ApplicationJson {

    private short id;

    private String name;

    private String version;

    private LocalDateTime createdDate;

    private LocalDateTime updatedDate;

    private ScriptJson script;

}
