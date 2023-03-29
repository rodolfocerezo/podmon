import React from 'react'
import './index.css'

interface CardProps {
  children?: React.ReactNode
}

function Card({ children }: CardProps) {
  return <div className="card">{children}</div>
}

export default Card
