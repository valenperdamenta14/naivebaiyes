from collections import defaultdict


def hitung_naive_bayes(
    dataset,
    motivasi,
    kehadiran
):

    total_data = len(dataset)

    kelas_list = []

    for row in dataset:
        kelas_list.append(
            row.kategori_prestasi
        )

    kelas_unik = list(set(kelas_list))

    hasil = {}

    for kelas in kelas_unik:

        jumlah_kelas = len([
            x for x in dataset
            if x.kategori_prestasi == kelas
        ])

        prior = jumlah_kelas / total_data

        motivasi_count = len([
            x for x in dataset
            if x.kategori_prestasi == kelas
            and x.kategori_motivasi == motivasi
        ])

        kehadiran_count = len([
            x for x in dataset
            if x.kategori_prestasi == kelas
            and x.kategori_kehadiran == kehadiran
        ])

        likelihood_motivasi = (
            motivasi_count / jumlah_kelas
        )

        likelihood_kehadiran = (
            kehadiran_count / jumlah_kelas
        )

        posterior = (
            prior
            * likelihood_motivasi
            * likelihood_kehadiran
        )

        hasil[kelas] = posterior

    prediksi = max(
        hasil,
        key=hasil.get
    )

    return {
        "prediksi": prediksi,
        "probabilitas": hasil[prediksi],
        "detail": hasil
    }