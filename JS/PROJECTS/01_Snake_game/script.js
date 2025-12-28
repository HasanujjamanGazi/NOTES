const board = document.querySelector(".board");

const boxHeight = 30;
const boxWidth = 30;
const rows = Math.floor(board.clientHeight / boxHeight);
const cols = Math.floor(board.clientWidth / boxWidth);

for (let row = 0; row < rows; row++) {
    for (let col = 0; col < cols; col++) {
        const box = document.createElement("div");
        box.classList.add("box");
        // box.textContent = `${row},${col}`;
        board.appendChild(box);
    }
}