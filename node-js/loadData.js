/**
 * Load file data
 */

import fs from 'fs'

let data = []

const readData = () => {
  console.log('Reading data...')
  const jsonString = fs.readFileSync('./static/albums.json')
  data = JSON.parse(jsonString)
  console.log('Done')
}

const getData = () => data

export { getData, readData }
