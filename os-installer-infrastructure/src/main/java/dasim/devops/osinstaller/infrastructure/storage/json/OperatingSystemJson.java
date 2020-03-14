package dasim.devops.osinstaller.infrastructure.storage.json;

import dasim.devops.osinstaller.infrastructure.storage.enumeration.OperatingSystemEnum;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class OperatingSystemJson {

    private OperatingSystemEnum name;

    private String version;

}
