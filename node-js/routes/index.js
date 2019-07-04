import express from 'express'

import getAlbumsByLimit from './../controllers/getAlbumsByLimit'
import getAllAlbums from './../controllers/getAllAlbums'

const router = express.Router()

router.get('/api/albums/:limit', getAlbumsByLimit)

// get all albums by default
router.get('/api/albums', getAllAlbums)

// default route
router.get('*', (req, res) => {
  res.send({ api: 'Fake Music API Service', version: 1.0 })
})

export default router
