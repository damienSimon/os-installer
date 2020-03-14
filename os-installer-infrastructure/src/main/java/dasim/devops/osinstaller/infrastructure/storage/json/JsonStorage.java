package dasim.devops.osinstaller.infrastructure.storage.json;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.springframework.stereotype.Component;
import com.google.gson.Gson;

/**
 * Class which manage the persistency of the data in json format
 */
@Component
public class JsonStorage {

    private static final String DATABASE_PATH = "database.json";

    /**
     * Write data to the json file database.json
     *
     * @param data to store to the database json format
     * @throws IOException exception if error occurs when file is written
     */
    public void write(final DatabaseJson data) throws IOException {

        new Gson().toJson(data, new FileWriter(DATABASE_PATH));
    }

    /**
     * Load json file database.json which contains all datas
     *
     * @return all datas contains in the database json format
     * @throws FileNotFoundException exception if error occurs when file is read
     */
    public DatabaseJson loadJsonFile() throws FileNotFoundException {

        return new Gson().fromJson(new FileReader(DATABASE_PATH), DatabaseJson.class);
    }
}
