const fs = require('fs');

class Grid {
  constructor(str) {
    this.grid = str.split('\n')
                   .map(l => l.split('').map(s => Number(s)));
    this.flashed = 0;
  }

  step() {
    this.incrementGridByOne();

    

    while (this.cells().filter(([x, y, c]) => c > 9).length > 0) {
      const toFlash = this.cells().filter(([x, y, c]) => c > 9);
      toFlash.forEach(([x, y, c] )=> {
        this.grid[x][y] = null
        this.flashed += 1
        this.neighbors(x, y).forEach(([x2, y2]) => {
          if (this.grid[x2] && this.grid[x2][y2]) {
            this.grid[x2][y2] += 1
          }
        });
      });
  
    }

    this.grid.forEach((row, x) => {
      row.forEach((cell, y) => {
        if (cell === null) {
          this.grid[x][y] = 0;
        }
      })
    });
  }

  neighbors(x, y) {
    return [
      [x - 1, y - 1], [x, y - 1], [x + 1, y - 1],
      [x - 1, y    ],             [x + 1, y    ], 
      [x - 1, y + 1], [x, y + 1], [x + 1, y + 1],
    ]
  }

  cells() {
    let cells = []
    this.grid.forEach((row, x) => {
      row.forEach((cell, y) => cells.push([x, y, cell]))
    });
    return cells;
  }

  incrementGridByOne() {
    this.grid = this.grid.map(row => {
      return row.map(cell => cell += 1)
    });
  }

  print() {
    this.grid.forEach(row => {
      console.log(row.map(c => c.toString(16).toUpperCase()).join(' '))
    });
  }
}

const file = fs.readFileSync('./input', 'utf-8');
const grid = new Grid(file);

console.log('Before any steps:');
grid.print()

for (let i = 1; i <= 100; i++) {
  console.log(`After step ${i}:`);
  grid.step();
  grid.print();
  console.log(grid.flashed);
}
