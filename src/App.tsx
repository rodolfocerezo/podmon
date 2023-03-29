import React from 'react'
import { Card, Main } from '@components'
import './App.css'

interface AppProps {}

function App({}: AppProps) {
  return (
    <Main>
      <div className="menu"></div>
      <div className="content">
        <Card></Card>
        <Card></Card>
      </div>
    </Main>
  )
}

export default App
