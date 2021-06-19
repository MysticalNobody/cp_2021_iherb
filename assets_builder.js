/// ************** NOTICE **************
///
/// To use images from assets folder please use \`AssetsImage()\`.
/// If you need to use \`Image.asset()\` use "assets/" prefix
///
/// *************END NOTICE **************

const path = require("path");
const fs = require("fs");

const relativePathToIcons = "assets/icons";
const pathToIcons = "icons";
const relativePathToImages = "assets/images";
const pathToImages = "images";
const relativePathToUiThemeFile = "./lib/presentation/theme/icons_and_images.dart";

function toProperCase(str) {
  if (str == null || str.length <= 1) return "";
  return `${str[0].toUpperCase()}${str.substring(1)}`;
}

function underscoreToProperCase(str) {
  if (str == null || str.length <= 1) return "";
  return str
    .split("_")
    .map((el) => toProperCase(el))
    .join("");
}

function main() {
  const iconsStrArr = [];
  const imagesStrArr = [];

  const readFiles = ({ strArr, absolutePath, relativePath, filePrefix }) => {
    for (const maybeFileOrFolderName of strArr) {
      const newPath = `${absolutePath}/${maybeFileOrFolderName}`;
      const isFolder = fs.lstatSync(newPath).isDirectory();
      const newRelativePath = `${relativePath}/${maybeFileOrFolderName}`;
      if (isFolder) {
        const strFiles = fs.readdirSync(newPath);
        readFiles({
          strArr: strFiles,
          absolutePath: newPath,
          relativePath: newRelativePath,
          filePrefix,
        });
      }
      const isIcon = maybeFileOrFolderName.includes(".svg");
      const isImage = maybeFileOrFolderName.includes(".png");
      const maybeFileName = maybeFileOrFolderName.split(".")[0];

      if (maybeFileName == null || maybeFileName.length <= 1) continue;

      // Getting latest folder name
      const pathSegments = relativePath.split("/");
      const prefix = underscoreToProperCase(
        pathSegments[pathSegments.length - 1]
      );

      const maybeProperFileName = underscoreToProperCase(maybeFileName);

      // Final import string
      const finalStr = `static const ${prefix.toLowerCase()}${maybeProperFileName} = "assets/${newRelativePath}";`;
      switch (true) {
        case isIcon:
          iconsStrArr.push(finalStr);
          break;
        case isImage:
          imagesStrArr.push(finalStr);
          break;
      }
    }
  };
  const iconsPath = path.join(__dirname, `./${relativePathToIcons}`);
  const iconFilesStrArr = fs.readdirSync(iconsPath);
  readFiles({
    relativePath: pathToIcons,
    absolutePath: iconsPath,
    strArr: iconFilesStrArr,
    filePrefix: "i",
  });

  const imagesPath = path.join(__dirname, `./${relativePathToImages}`);
  const imageFilesStrArr = fs.readdirSync(imagesPath);
  readFiles({
    relativePath: pathToImages,
    absolutePath: imagesPath,
    strArr: imageFilesStrArr,
    filePrefix: "i",
  });

  const finalStr = ` 
/// ************** note *************
///
/// ! Please do not change this file manually
/// If you need to generate file, run \`node assets_builder\`
/// It will take all icons and images to generate this file.
///
/// ************ end note *************

/// ************** NOTICE **************
///
/// To use images from assets folder please use \`AssetsImage()\`.
/// If you need to use \`Image.asset()\` use "assets/" prefix
///
/// *************END NOTICE **************

class AppIcons{
  ${iconsStrArr.join("\n")}
}

class AppImages{
  ${imagesStrArr.join("\n")}  
}
`;
  const finalPath = path.join(__dirname, relativePathToUiThemeFile);
  try {
    fs.rmSync(finalPath);
  } catch (error) {}

  fs.writeFileSync(finalPath, finalStr);
}

main();
