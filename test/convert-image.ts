import { readFileSync, writeFileSync } from "fs";
import { PNG } from "pngjs";

const filename = process.argv[2];

const png = PNG.sync.read(readFileSync(filename));

writeFileSync(
  `${filename.substr(0, filename.lastIndexOf(`.`))}.rgba`,
  png.data
);

console.log(`${png.width}x${png.height}`);
