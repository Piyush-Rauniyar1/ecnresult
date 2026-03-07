import { v2 as cloudinary } from 'cloudinary';

cloudinary.config({
    cloud_name: process.env.NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
});

export async function uploadCandidatePhoto(url: string, ecnId: string) {
    try {
        const result = await cloudinary.uploader.upload(url, {
            folder: 'nepal-2082/candidates',
            public_id: `candidate_${ecnId}`,
            transformation: [
                { width: 200, height: 200, crop: 'fill', gravity: 'face', radius: 'max' }
            ]
        });
        return result.secure_url;
    } catch (err) {
        console.error(`Failed to upload photo for candidate ${ecnId}`, err);
        return null;
    }
}

export async function uploadPartySymbol(url: string, partyId: string) {
    try {
        const result = await cloudinary.uploader.upload(url, {
            folder: 'nepal-2082/party-symbols',
            public_id: `party_${partyId}`,
            transformation: [{ width: 80, height: 80, crop: 'pad', background: 'white' }]
        });
        return result.secure_url;
    } catch (err) {
        console.error(`Failed to upload party symbol ${partyId}`, err);
        return null;
    }
}
