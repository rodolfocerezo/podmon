import React from 'react'
import './index.css'

interface MainProps {
  children: React.ReactNode
}

function Main({ children }: MainProps) {
  return <div className="main">{children}</div>
}

export default Main
