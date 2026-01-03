from config import db
from werkzeug.security import generate_password_hash, check_password_hash

def check_login(username, password):
    cursor = db.cursor()
    
    sql = """
    SELECT users.id_user, users.username, users.password, roles.nama_role, anggota.nama
    FROM users
    JOIN roles ON users.id_role = roles.id_role
    LEFT JOIN anggota ON users.id_user = anggota.id_user
    WHERE users.username = %s
    """
    cursor.execute(sql, (username,))
    user = cursor.fetchone()

    if user and check_password_hash(user[2], password):
        return {
            'id_user': user[0],
            'username': user[1],
            'nama_role': user[3],
            'nama_asli': user[4] if user[4] else user[1]
        }
    return None

def insertUser(username, password, id_role):
    cursor = db.cursor()
    hashed_password = generate_password_hash(password)
    sql = "INSERT INTO users (username, password, id_role) VALUES (%s, %s, %s)"
    cursor.execute(sql, (username, hashed_password, id_role))
    db.commit()



def getKegiatan():
    cursor = db.cursor()
    sql = """
    SELECT kegiatan.id_kegiatan, 
           kegiatan.nama_kegiatan, 
           kegiatan.tanggal, 
           kegiatan.deskripsi, 
           users.username,
           kegiatan.id_user
    FROM kegiatan
    JOIN users ON kegiatan.id_user = users.id_user
    ORDER BY kegiatan.tanggal DESC
    """
    cursor.execute(sql)
    return cursor.fetchall()

def insertKegiatan(nama, tanggal, deskripsi, id_user):
    cursor = db.cursor()
    sql = "INSERT INTO kegiatan (nama_kegiatan, tanggal, deskripsi, id_user) VALUES (%s, %s, %s, %s)"
    cursor.execute(sql, (nama, tanggal, deskripsi, id_user))
    db.commit()

def getKegiatanById(id):
    cursor = db.cursor()
    sql = "SELECT id_kegiatan, nama_kegiatan, tanggal, deskripsi, id_user FROM kegiatan WHERE id_kegiatan = %s"
    cursor.execute(sql, (id,))
    return cursor.fetchone()

def updateKegiatan(id, nama, tanggal, deskripsi, id_user):
    cursor = db.cursor()
    sql = """
    UPDATE kegiatan 
    SET nama_kegiatan=%s, tanggal=%s, deskripsi=%s, id_user=%s 
    WHERE id_kegiatan=%s
    """
    cursor.execute(sql, (nama, tanggal, deskripsi, id_user, id))
    db.commit()

def deleteKegiatan(id):
    cursor = db.cursor()
    sql = "DELETE FROM kegiatan WHERE id_kegiatan = %s"
    cursor.execute(sql, (id,))
    db.commit()



def getAllAnggota():
    cursor = db.cursor()
    sql = "SELECT nama, nim, jabatan FROM anggota"
    cursor.execute(sql)
    return cursor.fetchall()

def insertAnggota(nama, nim, jabatan, id_user):
    cursor = db.cursor()
    sql = "INSERT INTO anggota (nama, nim, jabatan, id_user) VALUES (%s, %s, %s, %s)"
    cursor.execute(sql, (nama, nim, jabatan, id_user))
    db.commit()