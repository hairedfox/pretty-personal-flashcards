import ApplicationController from './application_controller'

export default class extends ApplicationController {
    static targets = ['preview', 'fileSelect', 'trigger']

    connect() {
        super.connect()
    }

    previewImage(event) {
        event.preventDefault()
        if (event.target.value.length > 0) {
            this.displayImage(event)
        } else {
            this.clearImage(event)
        }

    }

    displayImage(event) {
        const file = event.target.files[0]
        var reader = new FileReader()
        const preview = this.previewTarget
        const trigger = this.triggerTarget
        reader.onload = function() {
            preview.src = reader.result
            trigger.classList.add('d-none')
        }

        reader.readAsDataURL(file)
    }

    clearImage(event) {
        this.previewTarget.src = ''
        this.triggerTarget.classList.remove('d-none')
    }

    selectFile(event) {
        const input = this.fileSelectTarget

        input.click()
    }
}
