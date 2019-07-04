import { getData } from '../loadData'

const getAlbumsByLimit = (req, res, next) => {
  const musicData = getData()
  return res.send(musicData.slice(0, req.params.limit))
}

export default getAlbumsByLimit
