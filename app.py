from flask import Flask, render_template, request, redirect, url_for, session, flash
from models import (
    check_login,
    getKegiatan, insertKegiatan,
    getKegiatanById, updateKegiatan, deleteKegiatan,
    insertUser, getAllAnggota, insertAnggota  
)

app = Flask(__name__)
app.secret_key = "secret-key-organisasi-2025" 

def is_logged_in():
    return 'user_id' in session

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        user = check_login(username, password)
        if user:
            session['user_id'] = user['id_user']
            session['username'] = user['username']
            session['role'] = user['nama_role']
            session['nama_asli'] = user['nama_asli']
 
            flash(f"Selamat datang {user['nama_asli']}! Login berhasil sebagai {user['nama_role']}.", "success")
            return redirect(url_for('index'))
        else: 
            flash("Username atau password salah!", "danger")

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    flash("Anda telah keluar dari sistem.", "info")
    return redirect(url_for('login'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if not is_logged_in():
        return redirect(url_for('login'))

    if session.get('role') != 'admin':
        flash("Akses ditolak! Hanya admin yang boleh menambah user.", "danger")
        return redirect(url_for('index'))

    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        id_role = request.form['id_role']

        insertUser(username, password, id_role)
        flash("User baru berhasil didaftarkan!", "success")
        return redirect(url_for('index'))

    return render_template('register.html')

@app.route('/')
def index():
    if not is_logged_in():
        return redirect(url_for('login'))

    return render_template(
        'index.html',
        username=session.get('username'),
        nama=session.get('nama_asli'),
        role=session.get('role')
    )

@app.route('/anggota')
def anggota():
    if not is_logged_in():
        return redirect(url_for('login'))
    
    data = getAllAnggota() 
    return render_template('anggota.html', data=data)

@app.route('/insert_anggota', methods=['GET', 'POST'])
def insert_anggota():
    if not is_logged_in():
        return redirect(url_for('login'))

    if request.method == 'POST':
        insertAnggota(
            request.form['nama'],
            request.form['nim'],
            request.form['jabatan'],
            session['user_id']
        )
        flash("Anggota baru berhasil ditambahkan!", "success")
        return redirect(url_for('anggota'))

    return render_template('insert_anggota.html')

@app.route('/read')
def read():
    if not is_logged_in():
        return redirect(url_for('login'))
    
    data = getKegiatan()
    return render_template('read.html', data=data)

@app.route('/insert', methods=['GET', 'POST'])
def insert():
    if not is_logged_in():
        return redirect(url_for('login'))

    if request.method == 'POST':
        insertKegiatan(
            request.form['nama_kegiatan'],
            request.form['tanggal'],
            request.form['deskripsi'],
            session['user_id']
        )
        flash("Data kegiatan berhasil ditambahkan!", "success")
        return redirect(url_for('read'))

    return render_template('insert_kegiatan.html')

@app.route('/update/<int:id>', methods=['GET', 'POST'])
def update(id):
    if not is_logged_in():
        return redirect(url_for('login'))

    if request.method == 'POST':
        updateKegiatan(
            id,
            request.form['nama_kegiatan'],
            request.form['tanggal'],
            request.form['deskripsi'],
            session['user_id']
        )
        
        flash("Data kegiatan berhasil diperbarui!", "warning")
        return redirect(url_for('read'))

    data = getKegiatanById(id)
    return render_template('update_kegiatan.html', data=data)

@app.route('/delete/<int:id>')
def delete(id):
    if not is_logged_in():
        return redirect(url_for('login'))
    
    deleteKegiatan(id)
    flash("Data kegiatan telah dihapus!", "danger")
    return redirect(url_for('read'))

if __name__ == '__main__':
    app.run(debug=True)