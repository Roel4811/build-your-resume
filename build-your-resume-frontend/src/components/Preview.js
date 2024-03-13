import React, { useState } from "react"

const InputWithPreview = () => {
  const [jobTitle, setJobTitle] = useState("")

  return (
    <div className="flex justify-center items-center h-screen">
      <div className="w-full md:w-1/2">
        <input
          type="text"
          value={jobTitle}
          onChange={(e) => setJobTitle(e.target.value)}
          className="w-full p-4 border border-gray-300 rounded-md shadow-md mb-4"
          placeholder="Enter your job title"
        />
        <div className="border border-gray-300 rounded-md p-4">
          <h1 className="text-lg font-bold mb-2">A4 Preview</h1>
          <div className="p-4 bg-white border border-gray-300 rounded-md">
            <p className="text-lg">{jobTitle}</p>
          </div>
        </div>
      </div>
    </div>
  )
}

export default InputWithPreview
