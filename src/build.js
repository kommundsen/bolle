const nodescad = require("nodescad");

const baseOptions = {
    binaryPath: 'OpenSCAD',
    inputFile: 'src/hamster-wheel.scad'
};
 

var queue = [];
for (let diameter of [210, 250, 300]) {
    for (let magnetDiameter of [0, 10]) {
        for (let quaterCut of [false, true]) {
            for (let format of ['stl']) {
                queue.push({
                    ...baseOptions,
                    outputFile: `dist/hamster-wheel-${diameter}-${magnetDiameter}${quaterCut ? '-quater' : '-full'}.${format}`,
                    format,
                    variables: {
                        Diameter: diameter,
                        TrackWidth: diameter / 4,
                        MagnetDiameter: magnetDiameter,
                        QuaterCut: quaterCut,
                    },
                });
            }
        }
    }
}

const render = () => {
    const [variant] = queue.splice(0, 1);
    if (variant) {
        console.log('Render ' + variant.outputFile);
        nodescad.render(variant, callback);
    }
}

const callback = (error, result) => {
    if (error)
        throw error
 
    if (result.buffer) {
        console.log(result.buffer.toString());
    }

    render();
};

render();