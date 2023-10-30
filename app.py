
import os
from flask import Flask, render_template, request, redirect, url_for
from flask import jsonify, send_file
from flask_mysqldb import MySQL
from werkzeug.urls import URL

app = Flask(__name__)

# Configure MySQL from environment variables
app.config['MYSQL_HOST'] = os.environ.get('MYSQL_HOST', 'localhost')
app.config['MYSQL_USER'] = os.environ.get('MYSQL_USER', 'admin')
app.config['MYSQL_PASSWORD'] = os.environ.get('MYSQL_PASSWORD', 'admin')
app.config['MYSQL_DB'] = os.environ.get('MYSQL_DB', 'cmddb')

# Initialize MySQL
mysql = MySQL(app)

# Define a folder to store the uploaded images
app.config['UPLOAD_FOLDER'] = 'uploads'

# Function to save the uploaded file


def save_file(file):
    if file:
        filename = file.filename
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        return filename  # Return the filename to store in the database


@app.route('/', methods=['GET', 'POST'])
def index():

    if request.method == 'POST':
        # Handle the form submission here
        category = request.form['category']
        if category == 'Other':
            category = request.form['new_category']
        description = request.form['description']
        execution = request.form['execution']
        uploaded_file = request.files.get('image')
        # Save the uploaded file or None
        image_filename = save_file(uploaded_file) if uploaded_file else None
        cur = mysql.connection.cursor()
        if image_filename:
            cur.execute("INSERT INTO cmdtable (category, description, execution, image) VALUES (%s, %s, %s, %s)",
                        (category, description, execution, image_filename))
        else:
            cur.execute("INSERT INTO cmdtable (category, description, execution) VALUES (%s, %s, %s)",
                        (category, description, execution))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('index'))

    else:
        # This block will be executed for GET requests (initial page load)
        cur = mysql.connection.cursor()
        cur.execute(
            'SELECT id, category, description, execution, image FROM cmdtable')
        data = cur.fetchall()
        cur.execute('SELECT DISTINCT category FROM cmdtable')
        categories = [row[0] for row in cur.fetchall()]
        cur.close()
        return render_template('index.html', data=data, categories=categories)


@app.route('/get_command/<int:command_id>', methods=['GET'])
def get_command(command_id):
    cur = mysql.connection.cursor()
    cur.execute(
        'SELECT id, category, description, execution, image FROM cmdtable WHERE id = %s', (command_id,))
    command = cur.fetchone()
    cur.close()
    data = {
        "id": command[0],
        "category": command[1],
        "description": command[2],
        "execution": command[3],
        "image": command[4]
    }
    response = jsonify(data)
    # Set Content-Type header
    response.headers['Content-Type'] = 'application/json'
    return response


@app.route('/update', methods=['POST'])
def update_command():
    if request.method == 'POST':
        command_id = request.form['id']
        update_category = request.form['update_category']
        if update_category == 'Other':
            update_category = request.form['new_update_category']
        update_description = request.form['update_description']
        update_execution = request.form['update_execution']

        update_image = request.files.get('update_image')
        if update_image:
            # Save the uploaded file and get the filename
            update_image_filename = save_file(update_image)
            # Update the database with the new image filename
            cur = mysql.connection.cursor()
            cur.execute("UPDATE cmdtable SET category = %s, description = %s, execution = %s, image = %s WHERE id = %s",
                        (update_category, update_description, update_execution, update_image_filename, command_id))
        else:
            # No new image uploaded, update the database without changing the image field
            cur = mysql.connection.cursor()
            cur.execute("UPDATE cmdtable SET category = %s, description = %s, execution = %s WHERE id = %s",
                        (update_category, update_description, update_execution, command_id))
        mysql.connection.commit()
        cur.close()

    # Redirect to the 'GET' version of the page
    return redirect(url_for('index'))


@app.route('/delete_command/<int:command_id>', methods=['DELETE'])
def delete_command(command_id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM cmdtable WHERE id = %s', (command_id,))
    mysql.connection.commit()
    cur.close()
    return jsonify({'message': 'Record deleted successfully'})


@app.route('/get_image/<path:filename>', methods=['GET'])
def get_image(filename):
    # Construct the image path based on your storage configuration
    image_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)

    # Return the image file using Flask's send_file function
    return send_file(image_path, as_attachment=False)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
