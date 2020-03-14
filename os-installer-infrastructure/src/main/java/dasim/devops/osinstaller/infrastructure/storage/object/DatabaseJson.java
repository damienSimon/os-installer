package dasim.devops.osinstaller.infrastructure.storage.object;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Class which describes the entire database in json format
 */
@Builder
@Getter
public class DatabaseJson {

    private LocalDateTime updatedDate;

    private List<TemplateJson> templates;

    private List<ApplicationJson> applications;

}
