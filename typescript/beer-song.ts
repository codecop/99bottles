export default class Beer {

    static verse(n: number): string {
        return `${Beer.bottles(n)} of beer on the wall, ${Beer.bottles(n)} of beer.
Take ${Beer.it(n)} down and pass it around, ${Beer.bottles(n - 1)} of beer on the wall.
`
    }

    static it(n: number): string {
        return n > 1 ? 'one' : 'it'
    }

    private static bottles(n: number): string {
        if (n > 1) {
            return `${n} bottles`
        }
        else if (n === 1) {
            return `${n} bottle`
        }
        else {
            return `no more bottles`
        }
    }

    static sing(start: number = 99, end: number = 0): string {
        if (start < end) {
            return ''
        }
        return Beer.verse(start) + Beer.sing(start - 1, end)
    }

}
