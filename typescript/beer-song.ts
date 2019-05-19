export default class Beer {

    static verse(n: number): string {
        return `${n} bottles of beer on the wall, ${n} bottles of beer.
    Take one down and pass it around, ${n - 1} bottles of beer on the wall.
    `
    }

    static sing(start: number = 99, end: number = 0): string {
        if (start < end) {
            return ''
        }
        return Beer.verse(start) + Beer.sing(start - 1, end)
    }

}
