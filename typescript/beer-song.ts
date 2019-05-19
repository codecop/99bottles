export default class Beer {

    static verse(n: number): string {
        const wall = `${Beer.bottles(n, true)} of beer on the wall, ${Beer.bottles(n)} of beer.
`
        const take = `Take ${Beer.it(n)} down and pass it around, ${Beer.bottles(n - 1)} of beer on the wall.
`
        const buy = `Go to the store and buy some more, 99 bottles of beer on the wall.
`
        return wall + (n > 0 ? take : buy)
    }

    static it(n: number): string {
        return n > 1 ? 'one' : 'it'
    }

    private static bottles(n: number, upper: boolean = false): string {
        if (n > 1) {
            return `${n} bottles`
        }
        else if (n === 1) {
            return `${n} bottle`
        }
        else if (upper) {
            return `No more bottles`
        }
        else {
            return `no more bottles`
        }
    }

    static sing(start: number = 99, end: number = 0): string {
        const current = Beer.verse(start)
        if (start <= end) {
            return current
        }
        return current + "\n" + Beer.sing(start - 1, end)
    }

}
