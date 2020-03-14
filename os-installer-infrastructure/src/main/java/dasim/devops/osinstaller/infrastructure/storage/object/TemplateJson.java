package dasim.devops.osinstaller.infrastructure.storage.object;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Class which describes a template in json format
 */
@Builder
@Getter
public class TemplateJson {

    private short id;

    private String name;

    private String author;

    private LocalDateTime createdDate;

    private LocalDateTime updatedDate;

    private OperatingSystemJson operatingSystem;

    private List<ApplicationJson> applications;

}
