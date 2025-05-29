package com.javaweb.config;

import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Component
public class BuildingImagePath {
    private static final Path CURRENT_FOLDER = Paths.get(System.getProperty("user.dir"));
    public String getImagePath(MultipartFile image, BuildingDTO buildingDTO)  {
        Path staticPath = Paths.get("static");
        Path imagePath = Paths.get("images");
        try {
            if (!Files.exists(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath))) {
                Files.createDirectories(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath));
            }
            Path file = CURRENT_FOLDER.resolve(staticPath)
                    .resolve(imagePath).resolve(image.getOriginalFilename());
            try (OutputStream os = Files.newOutputStream(file)) {
                os.write(image.getBytes());
            }
        }catch (IOException e) {}
        return imagePath.resolve(image.getOriginalFilename()).toString();
    }
}
