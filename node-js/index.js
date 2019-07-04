import express from 'express'
import logger from 'morgan'
import compression from 'compression'
import helmet from 'helmet'

import router from './routes'
import { readData } from './loadData'

const name = 'Fake Music API'

const app = express()
const PORT = process.env.PORT || 3001

// middlewares
app.use(helmet())
app.use(logger('dev'))
app.use(express.urlencoded({ extended: false }))
app.use(express.json())
app.use(compression())

// read data from file
readData()

// routes
app.use('/', router)

// error handler
app.use((err, req, res, next) => res.status(err.status || 500).send(err.message || 'Internal server error'))

// start server
app.listen(PORT, () => {
  console.log('%o server listening on port: %o', name, PORT)
})
