import { getData } from './../loadData'

const getAllAlbums = (req, res, next) => {
  const musicData = getData()
  return res.send(musicData)
}

export default getAllAlbums
