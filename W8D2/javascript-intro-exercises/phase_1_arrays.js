Array.prototype.uniq = function () {
    const uniques = []

    for (let i = 0; i < this.length; i++ ) {
        const num = this[i]
        if ( !uniques.includes(num) ) {
            uniques.push(num)
        }
    }

    return uniques
}

console.log([1,1,2,3,5,4,4].uniq())


Array.prototype.twoSum = function () {
    const twoSumPairs = []

    for ( let i = 0; i < this.length; i++ ) {
        const num1 = this[i]
        for ( let j = i + 1; j < this.length; j++ ) {
            const num2 = this[j]
            
            if ( num1 + num2 === 0 ) {
                twoSumPairs.push([i, j])
            }
        }
    }

    return twoSumPairs
}

console.log([1, 3, -1, -3, 5].twoSum())


Array.prototype.transpose = function () {
    const transposed = Array.from(
        { length: this.length }, 
        () => Array.from({ length: this.length })
    )

    for ( let i = 0; i < this.length; i++ ) {
        for ( let j = 0; j < this.length; j++ ) {
            transposed[j][i] = this[i][j]
        }
    }

    return transposed
}

console.log([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]].transpose()
)