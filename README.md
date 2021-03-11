# bolle
## Hamster Wheel

This is a project about creating a hamster wheel from scratch using [OpenSCAD](https://www.openscad.org/) for printing on my
[Ender 3 Pro](https://www.creality3dshop.eu/collections/3d-printers/products/creality3d-ender-3-pro-high-precision-3d-printer?gclid=Cj0KCQiA-aGCBhCwARIsAHDl5x__n8S7GgtrluFJzJKNJ22t7qdyFaz6EdEFtfAuJsvOKpQoZJ-TBagaAkPdEALw_wcB) printer.

## Goals
* Happy daughter!
* Happy hamster!
* Learn basics of OpenSCAD.
* Become better at printing.
* Maybe some Arduino magic at the end.

## Files

Prerendered STL files are available under the [dist](dist) folder. 

The files follow the pattern: 
`hamster-wheel-{diameter}-{magnetDiameter}-{variant}.stl`

For printers with small build volume you can select the `quater` variant as I do. You need to print 4 quaters to get a full wheel and glue them together.

## Resources
* [OpenSCAD](https://www.openscad.org/)
* [All about hamster wheels](https://www.hamstersociety.sg/hamster-care-blog/2019/1/26/all-about-wheels-for-different-hamsters)

## License

[MIT License](LICENSE)

## Changelog

### 0.0.2 March 11th 2021
* Added "tapered" design
* Added build script