export default class Beer {

    public static verse(numberOfBottles: number): string {
        return Beer.firstLine(numberOfBottles) +
            Beer.secondLine(numberOfBottles)
    }

    private static firstLine(numberOfBottles: number): string {
        const bottles = Beer.bottles(numberOfBottles)
        return Beer.capitalizeSentence(`${bottles} of beer on the wall, ${bottles} of beer.
`)
    }

    private static bottles(numberOfBottles: number): string {
        if (numberOfBottles > 1) {
            return `${numberOfBottles} bottles`
        }
        else if (numberOfBottles === 1) {
            return `${numberOfBottles} bottle`
        }
        else {
            return `no more bottles`
        }
    }

    private static capitalizeSentence(sentence: string): string {
        return sentence.substr(0, 1).toUpperCase() + sentence.substr(1)
    }

    private static secondLine(numberOfBottles: number): string {
        if (numberOfBottles > 0) {
            return Beer.takeOneDown(numberOfBottles)
        } else {
            return Beer.goToTheStore()
        }
    }

    private static takeOneDown(numberOfBottles: number) {
        const it = Beer.it(numberOfBottles)
        const remainingBottles = Beer.bottles(numberOfBottles - 1)
        return `Take ${it} down and pass it around, ${remainingBottles} of beer on the wall.
`
    }

    private static it(numberOfBottles: number): string {
        return numberOfBottles > 1 ? 'one' : 'it'
    }

    private static goToTheStore() {
        return `Go to the store and buy some more, 99 bottles of beer on the wall.
`
    }

    static sing(start: number = 99, end: number = 0): string {
        const current = Beer.verse(start)
        if (start <= end) {
            return current
        }
        return current + "\n" + Beer.sing(start - 1, end)
    }

}
